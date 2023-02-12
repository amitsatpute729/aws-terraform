module "glue_catalog_database" {
  source = "../../modules/glue-catalog-database"

  catalog_database_name        = "payments"
  catalog_database_description = "Glue Catalog database for the data located in ${local.data_source}"
  location_uri                 = local.data_source

  context = module.this.context
}

module "glue_catalog_table" {
  source = "../../modules/glue-catalog-table"

  catalog_table_name        = "medicare"
  catalog_table_description = "Test Glue Catalog table"
  database_name             = module.glue_catalog_database.name

  storage_descriptor = {
    # Physical location of the table
    location = local.data_source
  }

  context = module.this.context
}


module "glue_crawler" {
  source = "../../modules/glue-crawler"

  crawler_description = "Glue crawler that processes data in ${local.data_source} and writes the metadata into a Glue Catalog database"
  database_name       = module.glue_catalog_database.name
  role                = local.role_arn
  schedule            = "cron(0 1 * * ? *)"

  schema_change_policy = {
    delete_behavior = "LOG"
    update_behavior = null
  }

  catalog_target = [
    {
      database_name = module.glue_catalog_database.name
      tables        = [module.glue_catalog_table.name]
    }
  ]

  context = module.this.context

  depends_on = [
    aws_lakeformation_permissions.default
  ]
}
