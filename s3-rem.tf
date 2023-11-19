terraform {
  backend "s3" {
    bucket = "myjenbucket"
    key    = "remote.tfstate"
    region = "us-east-1"
  }
}
