#
# google provider related vars
#
variable "google_project" {
  description = "google cloud project ID"
  default     = "plasma-geode-127520"
}

variable "google_region" {
  description = "google cloud region"
  default     = "us-central1"
}

variable "google_zone" {
  description = "google cloud region/zone"
  default     = "us-central1-b"
}

locals {
  # Name of google cloud container cluster to deploy into
  gke_cluster_name = "${var.deploy_name}-${var.env_name}"
}

#
# gke-std mod passed through vars
#
variable "initial_node_count" {
  description = "number of gke nodes to start"
  default     = 3
}

variable "gke_version" {
  description = "gke master/node version"
  default     = "latest"
}

variable "machine_type" {
  description = "machine type of default gke pool nodes"
  default     = "n1-standard-2"
}

#
# efd mod passed through vars
#
variable "env_name" {
  description = "Name of deployment environment."
}

variable "deploy_name" {
  description = "Name of deployment."
  default     = "efd"
}

variable "aws_zone_id" {
  description = "route53 Hosted Zone ID to manage DNS records in."
}

variable "domain_name" {
  description = "DNS domain name to use when creating route53 records."
}

variable "grafana_oauth_client_id" {
  description = "github oauth Client ID for grafana"
}

variable "grafana_oauth_client_secret" {
  description = "github oauth Client Secret for grafana."
}

variable "grafana_oauth_team_ids" {
  description = "github team id (integer value treated as string)"
}

variable "grafana_admin_user" {
  description = "grafana admin account name."
  default     = "admin"
}

variable "grafana_admin_pass" {
  description = "grafana admin account passphrase."
}

variable "tls_crt_path" {
  description = "wildcard tls certificate."
}

variable "tls_key_path" {
  description = "wildcard tls private key."
}

variable "dns_enable" {
  description = "create route53 dns records."
  default     = false
}

variable "dns_overwrite" {
  description = "overwrite pre-existing DNS records"
  default     = false
}

locals {
  # remove "<env>-" prefix for production
  dns_prefix = "${replace("${var.env_name}-", "prod-", "")}"

  prometheus_k8s_namespace     = "monitoring"
  kafka_k8s_namespace          = "kafka"
  grafana_k8s_namespace        = "grafana"
  influxdb_k8s_namespace       = "influxdb"
  telegraf_k8s_namespace       = "telegraf"
  nginx_ingress_k8s_namespace  = "nginx-ingress"
  kafka_efd_apps_k8s_namespace = "kafka-efd-apps"
  tls_crt                      = "${file(var.tls_crt_path)}"
  tls_key                      = "${file(var.tls_key_path)}"
}

variable "influxdb_admin_user" {
  description = "influxdb admin account name."
  default     = "admin"
}

variable "influxdb_admin_pass" {
  description = "influxdb admin account passphrase."
}

variable "github_user" {
  description = "GitHub username for authenticating to the GitHub API."
}

variable "github_token" {
  description = "GitHub personal access token for authenticating to the GitHub API"
}

variable "brokers_disk_size" {
  description = "Disk size for the cp-kafka brokers."
  default     = "15Gi"
}

variable "zookeeper_data_dir_size" {
  description = "Size for Data dir, where ZooKeeper will store the in-memory database snapshots."
  default     = "15Gi"
}

variable "zookeeper_log_dir_size" {
  description = "Size for data log dir, which is a dedicated log device to be used, and helps avoid competition between logging and snaphots."
  default     = "15Gi"
}

variable "influxdb_telegraf_pass" {
  description = "InfluxDB password for the telegraf user."
}

variable "prometheus_oauth_github_org" {
  description = "limit access to prometheus dashboard to members of this org"
}

variable "prometheus_oauth_client_id" {
  description = "github oauth client id"
}

variable "prometheus_oauth_client_secret" {
  description = "github oauth client secret"
}
