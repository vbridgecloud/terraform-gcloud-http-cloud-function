## REQUIRED VARIABLES

variable "bucket_name" {
  type        = string
  description = "Name of GCS bucket to use to store the Cloud Functions their contents on."
}

variable "name" {
  type        = string
  description = "A user-defined name of the function. Function names must be unique globally."
}

## OPTIONAL VARIABLES

variable "source_dir" {
  type        = string
  description = "Source directory containing the function source files. Its contents will be zipped and uploaded to the given `bucket_name`"
  default     = "" # "./cloudfunctions/${var.name}"
}

variable "description" {
  type        = string
  description = "(Optional) Description of the function."
  default     = "" # ${var.name} HTTP Cloud Function"
}

variable "runtime" {
  type        = string
  description = "(Optional) The runtime in which the function is going to run. One of `nodejs6`, `nodejs8`, `nodejs10`, `python37`, `go111`. Default value is `python37`."
  default     = "python37"
}

variable "entry_point" {
  type        = string
  description = "(Optional) Name of the function that will be executed when the Google Cloud Function is triggered. Default value is `__main__`"
  default     = "__main__"
}

variable "available_memory_mb" {
  type        = number
  description = "(Optional) Memory (in MB), available to the function. Default value is 128. Allowed values are: 128, 256, 512, 1024, and 2048."
  default     = 128
}

variable "timeout" {
  type        = number
  description = "(Optional) Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds."
  default     = 60
}

variable "environment_variables" {
  type        = map
  description = "(Optional) A set of key/value environment variable pairs to assign to the function."
  default     = {}
}

variable "service_account_email" {
  type        = string
  description = "(Optional) If provided, the self-provided service account to run the function with."
  default     = ""
}

variable "vpc_connector" {
  type        = string
  description = "(Optional) If provided, the vpc connector to use"
  default     = null
}

variable "max_instances" {
  type        = number
  description = "(Optional) Limit the degree to which your function will scale in response to incoming requests."
  default     = null
}

# @TODO

# region
# labels