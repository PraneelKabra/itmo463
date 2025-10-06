# Add values
# Use the AMI of the custom Ec2 image you previously created
imageid                = "ami-01e0206def74fd6a7"
# Use t2.micro for the AWS Free Tier
instance_type          = "t2.micro"
key_name               = "coursera-key"
vpc_security_group_ids = "sg-016e23d131cc09a96"
tag_name               = "module-06"
user_sns_topic         = "pk-updates"
elb_name               = "pk-elb"
tg_name                = "pk-tg"
asg_name               = "pk-asg"
desired                = 3
min                    = 2
max                    = 5
number_of_azs          = 3
region                 = "ap-south-1"
raw_s3_bucket          = "pk-raw-bucket"
finished_s3_bucket     = "pk-finished-bucket"
sqs_name               = "pk-sqs"
dynamodb_name          = "company"