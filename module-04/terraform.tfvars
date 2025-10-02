# Add values
# Find the Ubuntu server 22.04 AMI for your region at this URL
# https://cloud-images.ubuntu.com/locator/ec2/
# Custom AMI ID
custom_imageid         = "ami-01e0206def74fd6a7"
# Use t2.micro for the AWS Free Tier
instance_type          = "t3.micro"
key_name               = "coursera-key"
vpc_security_group_ids = "sg-016e23d131cc09a96"
cnt                    = 1
tag_name               = "module-04"
aws_sns_topic          = "pk-sns-topic"
elb_name               = "pk-elb"
tg_name                = "pk-tg"
asg_name               = "pk-asg"
desired                = 1
min                    = 1
max                    = 3
num_of_azs             = 3
region                 = "ap-south-1"
raw_s3_bucket          = "pk-raw-bucket"
finished_s3_bucket     = "pk-fin-bucket"
dbname                 = "pkmodule04"
snapshot_identifier    = ""
sqs_name               = "pk-sqs"
username               = "controller"
