terraform {
  required_version = ">= 1.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }

  }
    backend "s3" {
        bucket         = "mudit-tf-snf-learn-s3-bucket-1"
        key            = "dev/tf_state/terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
        use_lockfile   = true # Native S3 locking (No DynamoDB needed!)
  }

    provider "aws" {
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_ACCESS_KEY
    region     = "us-east-1"
    }
}

locals {
snowfalke_auth = {
    organization_name = var.SNOWFLAKE_ORGANIZATION_NAME
    account_name      = var.SNOWFLAKE_ACCOUNT_NAME
    user              = var.SNOWFLAKE_USER
    authenticator     = "SNOWFLAKE_JWT"
    private_key       = file(var.PRIVATE_KEY_PATH)
    #private_key_passphrase = var.private_key_passphrase
}

}

provider "snowflake" {
  alias             = "sys_admin"
  role              = "SYSADMIN"
  organization_name = local.snowflake_auth.organization_name
  account_name      = local.snowflake_auth.account_name
  user              = local.snowflake_auth.user
  authenticator     = local.snowflake_auth.authenticator
  private_key       = local.snowflake_auth.private_key
  #private_key_passphrase = local.snowflake_auth.private_key_passphrase
}
