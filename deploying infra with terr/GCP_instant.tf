provider "google" {
  credentials = file("platinum-device-339313-643482da01b4.json")
  project     = "platinum-device-339313"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_compute_instance" "default" {
  name         = "trials${count.index}"
  machine_type = "e2-micro"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
  count = 2
}
