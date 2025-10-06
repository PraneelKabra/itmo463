#Types
#The Terraform language uses the following types for its values:

# https://developer.hashicorp.com/terraform/language/expressions/types
# string: a sequence of Unicode characters representing some text, like "hello".
# number: a numeric value. The number type can represent both whole numbers like 15 and fractional values like 6.283185.
# bool: a boolean value, either true or false. bool values can be used in conditional logic.
# list (or tuple): a sequence of values, like ["us-west-1a", "us-west-1c"]. Identify elements in a list with consecutive whole numbers, starting with zero.
# set: a collection of unique values that do not have any secondary identifiers or ordering.
# map (or object): a group of values identified by named labels, like {name = "Mabel", age = 52}.

# Default types are stings, lists, and maps

variable "imageid" {}
variable "instance_type" {}
variable "key_name" {}
variable "vpc_security_group_ids" {}
variable "az" { default = ["ap-south-1a", "ap-south-1b"] }
variable "tag_name" {}
variable "user_sns_topic" {}
variable "elb_name" {}
variable "tg_name" {}
variable "asg_name" {}
variable "min" {}
variable "max" {}
variable "desired" {}
variable "number_of_azs" {}
variable "region" {}
variable "raw_s3_bucket" {}
variable "finished_s3_bucket" {}
variable "sqs_name" {}
variable "dynamodb_name" {}