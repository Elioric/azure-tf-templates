project_prefix = "sample"
environment = "sample"
primary_location = "centralus"
secondary_location = "eastus2"
db_admin_login = "myuser"
db_admin_password = "test123!"
subscription_id = "20000000-0000-0000-0000-000000000000"

db = {
  name = "mydb"
  sku = "GP_Standard_D2s_v3"
  storage_size = 32768
  version = "15"
}

tags = {
  environment = "sample"
  autor = "kaylee.paez"
}