variable "AWS_ACCESS_KEY_ID" {
    type    = string
    description = "AWS access key ID"
    sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "AWS secret access key"
  sensitive   = true
}


variable "SNOWFLAKE_ORGANIZATION_NAME" {
  description = "The Snowflake organization name"
  type        = string
}

variable "SNOWFLAKE_ACCOUNT_NAME" {
  description = "The Snowflake account name"
  type        = string
}

variable "SNOWFLAKE_USER" {
  description = "The Snowflake user to authenticate as"
  type        = string
}

variable "PRIVATE_KEY_PATH" {
  description = "Path to the Snowflake private key file"
  type        = string
  default     = "~/.ssh/snowflake_key.p8"
}

/*
variable "private_key_passphrase" {
  description = "Passphrase for decrypting the private key"
  type        = string
  sensitive   = true
}
*/

# Environment
variable "ENVIRONMENT" {
  description = "Environment name"
  type        = string
}