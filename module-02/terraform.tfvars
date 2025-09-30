# Add values
# Find the Ubuntu server 22.04 AMI for your region at this URL
# https://cloud-images.ubuntu.com/locator/ec2/
imageid                = "ami-0f115dbaf1a9a8222"
# Use t2.micro for the AWS Free Tier
instance_type          = "t3.micro"
key_name               = "coursera-key"
vpc_security_group_ids = "sg-016e23d131cc09a96"
cnt                    = 1 
tag_name               = "module-02"
raw_bucket             = "pk-raw-bucket-new"
finished_bucket        = "pk-finished-bucket-new"
sns_topic              = "pk-topic"
sqs                    = "pk-sqs"
dbname                 = "pkmodule02"
uname                  = "controller"
pass                   = "wizard168"
elb_name               = "pk-elb"
asg_name               = "pk-asg"
min                    = 2
max                    = 5
desired                = 3
tg_name                = "pk-tg"