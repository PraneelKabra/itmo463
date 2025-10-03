# Add values
# Use the AMI of the custom Ec2 image you previously created
imageid         = "ami-01e0206def74fd6a7"
# Use t2.micro for the AWS Free Tier
instance_type          = "t3.micro"
key_name               = "coursera-key"
vpc_security_group_ids = "sg-016e23d131cc09a96"
tag_name               = "module-05"
user_sns_topic         = "pk-sns-topic"
elb_name               = "pk-elb"
tg_name                = "pk-tg"
asg_name               = "pk-asg"
desired                = 3
min                    = 2
max                    = 5
num_of_azs             = 3
region                 = "ap-south-1"
raw_s3_bucket          = "pk-raw-bucket"
finished_s3_bucket     = "pk-fin-bucket"
dbname                 = "pkmodule05"
snapshot_identifier    = "coursera-snapshot"
sqs_name               = "pk-sqs"
username               = "controller"
