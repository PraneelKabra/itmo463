# Add values
# Find the Ubuntu server 22.04 AMI for your region at this URL
# https://cloud-images.ubuntu.com/locator/ec2/
# Custom AMI ID
imageid                = "ami-0f115dbaf1a9a8222"
# Use t2.micro for the AWS Free Tier
instance_type          = "t3.micro"
key_name               = "coursera-key"
vpc_security_group_ids = "sg-016e23d131cc09a96"
cnt                    = 1
tag_name               = "module-04"
sns_topic              = "pk-topic"
elb_name               = "pk-elb"
tg_name                = "pk-tg"
asg_name               = "pk-asg"
desired                = 3
min                    = 2
max                    = 5
num_of_azs             = 3
region                 = "ap-south-1"
raw_s3_bucket          = "pk-raw-bucket"
finished_s3_bucket     = "pk-finished-bucket"
dbname                 = "pkmodule04"
snapshot_identifier    = ""
sqs_name               = "pk-sqs"
username               = "controller"
