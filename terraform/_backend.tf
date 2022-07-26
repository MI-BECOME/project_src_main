terraform {
  backend "s3" {
    bucket      = "busanit-tfbackend-s3"
    key         = "global/ec2/jenkins/terraform.tfstate"
    region      = "ap-northeast-2"
    #   role_arn    = "{ASSUMED_ROLE}"
    max_retries = 3
    }
 }
