# Add values
# Find the Ubuntu server 22.04 AMI for your region at this URL
# https://cloud-images.ubuntu.com/locator/ec2/
imageid                = "ami-0f115dbaf1a9a8222"
# Use t2.micro for the AWS Free Tier
instance-type          = "t2.micro"
key-name               = "coursera-key"
vpc_security_group_ids = ["sg-016e23d131cc09a96"]
cnt                    = 1 
tag-name               = "module-02"
raw-bucket             = "pk-raw-bucket"
finished-bucket        = "pk-finished-bucket"
sns-topic              = "pk-topic"
sqs                    = "pk-sqs"
dbname                 = "pkmodule02"
uname                  = "controller"
pass                   = "wizard168"
elb-name               = "pk-elb"
asg-name               = "pk-asg"
min                    = 2
max                    = 5
desired                = 3
tg-name                = "pk-tg"