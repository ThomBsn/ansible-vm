terraform {
    required_providers {
        virtualbox = {
            source  = "terra-farm/virtualbox"
            version = "0.2.2-alpha.1"
        }
        virtualbox = {
            source  = "shekeriev/virtualbox"
            version = "0.0.4"
        }
    }
}

provider "virtualbox" {}

resource "virtualbox_vm" "vm" {
    count  = 2
    name   = "vm-${count.index + 1}"
    cpus   = 1
    memory = "2048 mib"
    image  = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"

    network_adapter {
        type           = "bridged"
        host_interface = "Realtek Gaming 2.5GbE Family Controller"
    }
}
