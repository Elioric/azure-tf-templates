project_prefix = "sample" 
environment = "sample"
default_location = "brazilsouth"
containerappmi_name = "samplemi"
subscription_id = "20000000-0000-0000-0000-000000000000"
analytics_workspace_sku = "PerGB2018"

acr = {
  sku = "Standard"
}

aca = {
  assigned_cpu = 0.5
  assigned_memory = "1Gi"
  environment_name = "sample"
  prefix_back = "back"
  min_replicas = 1
  max_replicas = 2
  cpu_scaler_type = "Utilization" 
  cpu_scaler_value = "60" 
  memory_scaler_type = "Utilization" 
  memory_scaler_value = "70" 
  zone_redundant = false
}

agw = {
  backend_prefix = "back"
  protocol = "http"
}

aca_services = [
    "service01",
    "service02",
    "service03",
    "service04",
    "service05"
    ]

alerts = {
  cpu_alert_critical_value = 450000000
  cpu_alert_value = 400000000
  memory_alert_value = 800000000
}

tags = {
  environment = "sample"
}