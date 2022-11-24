locals { 
    owner = "roncoletta"
    environment = "DEV"
    common_tags = { 
        owner       = local.owner
        environment = local.environment
    }
}