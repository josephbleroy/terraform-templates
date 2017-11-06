# Specify the provider (GCP, AWS, Azure)
provider "google" {
credentials = "${file("/Users/joseph/.gcloud/ubuntu-1604-153101/terraform.json")}"
project = "ubuntu-1604-153101"
region = "us-west1"
}

# Create a new instance
resource "google_compute_instance" "ubuntu-xenial" {
   name = "ubuntu-xenial"
   machine_type = "f1-micro"
   zone = "us-west1-a"
   boot_disk {
      initialize_params {
      image = "ubuntu-1604-lts"
      size = "30"
   }
   

}
network_interface {
   network = "default"
   access_config {}
}
service_account {
   scopes = ["userinfo-email", "compute-ro", "storage-ro"]
   }

# add ssh key during provision   
metadata {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443"]
  }
}