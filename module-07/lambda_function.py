import json
import boto3
import os
from io import BytesIO
from PIL import Image
from botocore.exceptions import ClientError
from botocore.config import Config
from urllib.parse import urlparse
import logging

logger = logging.getLogger()
logger.setLevel("INFO")

def lambda_handler(event, context):
    # This entire block is indented to be inside the function
    logger.info('## LAMBDA FUNCTION STARTED')
    region = 'ap-south-1'
    clientS3 = boto3.client('s3', region_name=region, config=Config(s3={'addressing_style': 'path'}, signature_version='s3v4'))
    dynamodb_client = boto3.client('dynamodb', region_name=region)

    try:
        # This code is indented again to be inside the 'try' block
        s3_event = event['Records'][0]['s3']
        bucket_name = s3_event['bucket']['name']
        object_key = s3_event['object']['key']
        record_number = os.path.splitext(object_key)[0]
        logger.info(f"Processing object {object_key} from bucket {bucket_name}")

        response = clientS3.get_object(Bucket=bucket_name, Key=object_key)
        image_content = response['Body'].read()
        with Image.open(BytesIO(image_content)) as im:
            im = im.convert("L")  # Convert to grayscale
            buffer = BytesIO()
            im.save(buffer, "JPEG")
            buffer.seek(0)
        logger.info("Image successfully processed.")

        finished_bucket_name = bucket_name.replace("raw", "finished")
        clientS3.put_object(Bucket=finished_bucket_name, Key=object_key, Body=buffer, ContentType='image/jpeg')
        logger.info(f"Processed image uploaded to {finished_bucket_name}")

        presigned_url = clientS3.generate_presigned_url(
            'get_object',
            Params={'Bucket': finished_bucket_name, 'Key': object_key},
            ExpiresIn=3600
        )
        
        table_name = "pk-dynamo"
        dynamodb_client.update_item(
            TableName=table_name,
            Key={'RecordNumber': {'S': record_number}},
            UpdateExpression="SET FINSIHEDS3URL = :furl, RAWS3URL = :done",
            ExpressionAttributeValues={
                ':furl': {'S': presigned_url},
                ':done': {'S': 'done'}
            }
        )
        logger.info(f"DynamoDB table updated for {record_number}")

        clientS3.delete_object(Bucket=bucket_name, Key=object_key)
        logger.info(f"Deleted original object from {bucket_name}")

        return {
          'statusCode': 200,
          'body': json.dumps('Image processed and database updated successfully!')
        }

    except Exception as e:
        # This code is indented to be inside the 'except' block
        logger.error(f"An error occurred: {e}")
        return {
          'statusCode': 500,
          'body': json.dumps('An error occurred during processing.')
        }