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
    # TODO implement
    # https://stackoverflow.com/questions/40377662/boto3-client-noregionerror-you-must-specify-a-region-error-only-sometimes
    logger.info('## ENVIRONMENT VARIABLES')
    logger.info(os.environ['AWS_LAMBDA_LOG_GROUP_NAME'])
    region = 'ap-south-1'
    clientS3 = boto3.client('s3', region_name=region, config=Config(s3={'addressing_style': 'path'}, signature_version='s3v4'))

    # Create blank text file for S3 to put to the finished bucket
    with open('/tmp/pktest.txt', 'w') as creating_new_csv_file:
        pass
    print("Empty File Created Successfully")

    # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/s3/client/list_buckets.html
    responseS3 = clientS3.list_buckets()
    print("Pushing modified image to Finished S3 bucket...")
    for n in range(0,len(responseS3['Buckets'])):
        if "finished" in responseS3['Buckets'][n]['Name']:
            FIN_BUCKET_NAME = responseS3['Buckets'][n]['Name']

    # Trying to put the filename to the S3 bucket
    try:
        responseS3Put = clientS3.upload_file('/tmp/pktest.txt', FIN_BUCKET_NAME, 'pktest.txt')
    except ClientError as e:
        logging.error(e)
    
    return {
      'statusCode': 200,
      #'body': json.dumps(responsePresigned)
      'body': json.dumps('Hello from Lambda!')
  }
