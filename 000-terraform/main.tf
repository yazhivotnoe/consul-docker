resource "yandex_vpc_network" "vm_network" {
  name = "vm-network"
}

resource "yandex_vpc_subnet" "vm_subnet" {
  name           = "vm-subnet"
  network_id     = yandex_vpc_network.vm_network.id
  v4_cidr_blocks = var.subnet_v4_cidr_blocks
  zone           = var.vm_zone
}

resource "yandex_compute_instance" "servers" {
  count = var.server_count

  name        = "consul-server-${count.index}"
  platform_id = var.vm_platform_id
  zone        = var.vm_zone

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vmcue7aajpmeo39kk" # Ubuntu 22.04 LTS
      type     = "network-hdd"
      size     = 35
    }

  }

  network_interface {
    subnet_id = yandex_vpc_subnet.vm_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}
