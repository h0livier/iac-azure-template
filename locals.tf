locals {
  environments = {
    "dev" = "d"
    "test"= "t"
    "prod" = "p"
  }

  statefile = {
    "dev" = "dev.tfstate"
    "test"= "test.tfstate"
    "prod" = "prod.tfstate"
  }
}