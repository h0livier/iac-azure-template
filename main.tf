module "ressource_group_naming" {
  source = "git::https://github.com/h0livier/iac-naming-helper.git?ref=main"

  data = {
    project = "test"
    type    = "rg"
  }
  environment = "d"
}

resource "azurerm_resource_group" "ressource_group" {
  name     = module.ressource_group_naming.resource_group
  location = "West Europe"
}