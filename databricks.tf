data "databricks_node_type" "smallest" {
  local_disk = true

  depends_on = [
    azurerm_databricks_workspace.this
  ]
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true

  depends_on = [
    azurerm_databricks_workspace.this
  ]
}

resource "databricks_cluster" "this" {
  cluster_name = format("dbsc-%s-%s-%s",
  local.naming.location[var.location], var.environment, var.project)

  spark_version = data.databricks_spark_version.latest_lts.id
  node_type_id  = data.databricks_node_type.smallest.id

  autotermination_minutes = 20

  spark_conf = {
    "spark.databricks.cluster.profile" : "singleNode"
    "spark.master" : "local[*]"
  }

  custom_tags = {
    "ResourceClass" = "SingleNode"
 
  }
  depends_on = [
    azurerm_databricks_workspace.this
  ]
}







resource "databricks_group" "this" {
  display_name               = "P-AAP-Platform-Operators"
  allow_cluster_create       = true
  allow_instance_pool_create = true
}

resource "databricks_user" "srini" {
  user_name = "srinivasula.lekkala@zf.com"
   depends_on = [
    azurerm_databricks_workspace.this
  ]
}




resource "databricks_group_member" "vip_member1" {
  group_id  = databricks_group.this.id
  member_id = databricks_user.srini.id

   depends_on = [
    azurerm_databricks_workspace.this
  ]
}



resource "databricks_user" "praveen" {
  user_name = "praveen.ynala@zf.com"
   depends_on = [
    azurerm_databricks_workspace.this
  ]
}




resource "databricks_group_member" "vip_member2" {
  group_id  = databricks_group.this.id
  member_id = databricks_user.praveen.id

   depends_on = [
    azurerm_databricks_workspace.this
  ]
}







resource "databricks_user" "this" {
  user_name = "hitender.lekkprakash@zf.com"
   depends_on = [
    azurerm_databricks_workspace.this
  ]
}

resource "databricks_group_member" "vip_member" {
  group_id  = databricks_group.this.id
  member_id = databricks_user.this.id

   depends_on = [
    azurerm_databricks_workspace.this
  ]
}






resource "databricks_directory" "my_custom_directory" {
  path = "/Sandbox"
  
}

/**resource "databricks_global_init_script" "init1" {
  source = "${path.module}/init.sh"
  name   = "my init script"
}
**/

/*resource "databricks_global_init_script" "init2" {
  content_base64 = base64encode(<<-EOT
    #!/bin/bash
    echo "hello world"
    EOT
  )
  name = "hello script"
} */


resource "databricks_notebook" "notebook2" {
  content_base64 = base64encode(<<-EOT
    # created from ${abspath(path.module)}
    display(spark.range(10))
    EOT
  )
  path     = "/Shared/Demo"
  language = "PYTHON"
}
