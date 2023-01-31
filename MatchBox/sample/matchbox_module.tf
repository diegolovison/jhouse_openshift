module "matchbox" {
  source = "../modules/matchbox"

  cluster_name             = "${var.cluster_name}"
  matchbox_http_endpoint   = "${var.matchbox_http_endpoint}"
  matchbox_rpc_endpoint    = "${var.matchbox_rpc_endpoint}"
  matchbox_client_cert     = "${var.matchbox_client_cert}"
  matchbox_client_key      = "${var.matchbox_client_key}"
  matchbox_trusted_ca_cert = "${var.matchbox_trusted_ca_cert}"
  ssh_authorized_key       = "${var.ssh_public_key}"

  # configuration
  domain_name          = "${var.network_domain}"
  rhcos_kernel_path    = "${var.rhcos_kernel_path}"
  rhcos_initramfs_path = "${var.rhcos_initramfs_path}"
  rhcos_os_image_url   = "${var.rhcos_os_image_url}"
  rhcos_install_dev    = "${var.rhcos_install_dev}"
  webserver_doc_path   = "${var.webserver_doc_path}"

  # machines
  bootstrap_names = ["bootstrap"]
  bootstrap_mac = "52:54:00:11:00:20"
  bootstrap_domains = ["bootstrap.${var.cluster_name}.${var.network_domain}"]
  bootstrap_ign_path = "/var/www/html/bootstrap.ign"

  master_names   = [
      "master-0",
    ]

  master_macs    = [
          "52:54:00:11:01:20",
      ]

  master_domains = [
          "master-0.upi.example.com",
    
  ]

  master_ign_path = "/var/www/html/master.ign"

}

