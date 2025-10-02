# Add values
# Use the AMI of the custom Ec2 image you previously created
imageid                = "ami-01e0206def74fd6a7"
# Use t2.micro for the AWS Free Tier
instance-type          = "t2.micro"
key-name               = "coursera-key"
vpc_security_group_ids = "sg-016e23d131cc09a96"
tag-name               = "module-04"
user-sns-topic         = "pk-sns-topic"
elb-name               = "pk-elb"
tg-name                = "pk-tg"
asg-name               = "pk-asg"
desired                = 3
min                    = 2
max                    = 5
number-of-azs          = 3
region                 = "ap-south-1"
raw-s3-bucket          = "pk-raw-bucket"
finished-s3-bucket     = "pk-fin-bucket"
dbname                 = "company"
username               = "controller"
