locals {
  environments = {
    "dev"  = "d"
    "test" = "t"
    "prod" = "p"
  }
  environment = local.environments[var.environment]
}