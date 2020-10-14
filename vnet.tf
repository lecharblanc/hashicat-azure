resource "azurerm_resource_group" "myresourcegroup" {
  name     = "${var.prefix}-workshop"
  location = var.location
}

module "network" {
  source  = "app.terraform.io/BENNET-Training/network/azurerm"
  resource_group_name = azurerm_resource_group.myresourcegroup.name
  version = "3.0.1"
  # insert required variables here
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]
}

