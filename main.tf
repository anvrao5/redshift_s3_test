module "redshift" {
 source = "https://github.com/anvrao5/redshift_s3_test.git"

  # Redshift Cluster Inputs
  cluster_identifier      = "${var.redshift_cluster_identifier}"
  cluster_node_type       = "${var.redshift_cluster_node_type}"
  cluster_number_of_nodes = "${var.redshift_cluster_number_of_nodes}"

  cluster_database_name   = "${var.redshift_cluster_database_name}"
  cluster_master_username = "${var.redshift_cluster_master_username}"
  cluster_master_password = "${var.redshift_cluster_master_password}"

  # Group parameters
  wlm_json_configuration  = "${var.redshift_cluster_wlm_json_configuration}"

  # DB Subnet Group Inputs
  subnets         = ["${var.public_subnets}"]
  redshift_vpc_id = "${var.vpc_id}"
  private_cidr    = "${var.vpc_cidr}"

  # IAM Roles
  cluster_iam_roles = ["${aws_iam_role.redshift.arn}"]

  # Tags for all resources
  default_tags = "${local.default_tags}"
}
