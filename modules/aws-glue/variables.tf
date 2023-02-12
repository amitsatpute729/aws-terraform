
#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "TEST"
}

variable "environment" {
  description = "Environment for service"
  default     = "STAGE"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, etc."
  type        = map(string)
  default     = {}
}

#---------------------------------------------------
# AWS Glue catalog database
#---------------------------------------------------
variable "enable_glue_catalog_database" {
  description = "Enable glue catalog database usage"
  default     = false
}

variable "glue_catalog_database_name" {
  description = "The name of the database."
  default     = ""
}

variable "glue_catalog_database_description" {
  description = "(Optional) Description of the database."
  default     = null
}

variable "glue_catalog_database_catalog_id" {
  description = "(Optional) ID of the Glue Catalog to create the database in. If omitted, this defaults to the AWS Account ID."
  default     = null
}

variable "glue_catalog_database_location_uri" {
  description = "(Optional) The location of the database (for example, an HDFS path)."
  default     = null
}

variable "glue_catalog_database_parameters" {
  description = "(Optional) A list of key-value pairs that define parameters and properties of the database."
  default     = null
}

#---------------------------------------------------
# AWS Glue catalog table
#---------------------------------------------------
variable "enable_glue_catalog_table" {
  description = "Enable glue catalog table usage"
  default     = false
}

variable "glue_catalog_table_name" {
  description = "Name of the table. For Hive compatibility, this must be entirely lowercase."
  default     = ""
}

variable "glue_catalog_table_database_name" {
  description = "Name of the metadata database where the table metadata resides. For Hive compatibility, this must be all lowercase."
  default     = ""
}

variable "glue_catalog_table_description" {
  description = "(Optional) Description of the table."
  default     = null
}

variable "glue_catalog_table_catalog_id" {
  description = "(Optional) ID of the Glue Catalog and database to create the table in. If omitted, this defaults to the AWS Account ID plus the database name."
  default     = null
}

variable "glue_catalog_table_owner" {
  description = "(Optional) Owner of the table."
  default     = null
}

variable "glue_catalog_table_retention" {
  description = "(Optional) Retention time for this table."
  default     = null
}

variable "glue_catalog_table_partition_keys" {
  description = "(Optional) A list of columns by which the table is partitioned. Only primitive types are supported as partition keys."
  default     = []
}

variable "glue_catalog_table_view_original_text" {
  description = "(Optional) If the table is a view, the original text of the view; otherwise null."
  default     = null
}

variable "glue_catalog_table_view_expanded_text" {
  description = "(Optional) If the table is a view, the expanded text of the view; otherwise null."
  default     = null
}

variable "glue_catalog_table_table_type" {
  description = "(Optional) The type of this table (EXTERNAL_TABLE, VIRTUAL_VIEW, etc.)."
  default     = null
}

variable "glue_catalog_table_parameters" {
  description = "(Optional) Properties associated with this table, as a list of key-value pairs."
  default     = null
}

variable "glue_catalog_table_storage_descriptor" {
  description = "(Optional) A storage descriptor object containing information about the physical storage of this table. You can refer to the Glue Developer Guide for a full explanation of this object."
  default = {
    location                  = null
    input_format              = null
    output_format             = null
    compressed                = null
    number_of_buckets         = null
    bucket_columns            = null
    parameters                = null
    stored_as_sub_directories = null
  }
}

#---------------------------------------------------
# AWS Glue crawler
#---------------------------------------------------
variable "enable_glue_crawler" {
  description = "Enable glue crawler usage"
  default     = false
}

variable "glue_crawler_name" {
  description = "Name of the crawler."
  default     = ""
}

variable "glue_crawler_database_name" {
  description = "Glue database where results are written."
  default     = ""
}

variable "glue_crawler_role" {
  description = "(Required) The IAM role friendly name (including path without leading slash), or ARN of an IAM role, used by the crawler to access other resources."
  default     = ""
}

variable "glue_crawler_description" {
  description = "(Optional) Description of the crawler."
  default     = null
}

variable "glue_crawler_classifiers" {
  description = "(Optional) List of custom classifiers. By default, all AWS classifiers are included in a crawl, but these custom classifiers always override the default classifiers for a given classification."
  default     = null
}

variable "glue_crawler_configuration" {
  description = "(Optional) JSON string of configuration information."
  default     = null
}

variable "glue_crawler_schedule" {
  description = "(Optional) A cron expression used to specify the schedule. For more information, see Time-Based Schedules for Jobs and Crawlers. For example, to run something every day at 12:15 UTC, you would specify: cron(15 12 * * ? *)."
  default     = null
}

variable "glue_crawler_security_configuration" {
  description = "(Optional) The name of Security Configuration to be used by the crawler"
  default     = null
}

variable "glue_crawler_table_prefix" {
  description = "(Optional) The table prefix used for catalog tables that are created."
  default     = null
}

variable "glue_crawler_dynamodb_target" {
  description = "(Optional) List of nested DynamoDB target arguments."
  default     = []
}

variable "glue_crawler_jdbc_target" {
  description = "(Optional) List of nested JBDC target arguments. "
  default     = []
}

variable "glue_crawler_s3_target" {
  description = "(Optional) List nested Amazon S3 target arguments."
  default     = []
}

variable "glue_crawler_catalog_target" {
  description = "(Optional) List nested Amazon catalog target arguments."
  default     = []
}

variable "glue_crawler_schema_change_policy" {
  description = "(Optional) Policy for the crawler's update and deletion behavior."
  default     = []
}

variable "glue_crawler_recrawl_policy" {
  description = "Optional) A policy that specifies whether to crawl the entire dataset again, or to crawl only folders that were added since the last crawler run."
  default     = []
}

variable "glue_crawler_mongodb_target" {
  description = "(Optional) List nested MongoDB target arguments."
  default     = []
}

variable "glue_crawler_lineage_configuration" {
  description = "(Optional) Specifies data lineage configuration settings for the crawler."
  default     = []
}
