# Consul-docker

### Super simple full consul deploy for test something with him

![image](./image.png)

- before run command need to setup creds for YC cloud 

example provider.tf
```hcl
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  service_account_key_file = "/pathto/key.json"
  cloud_id                 = "cloud-id"
  folder_id                = "folder-id"
  zone                     = "ru-central1-b"
}
```

```bash
cd 000-terraform && tf init && tf apply
```

###  install consul via ansible

- before run command need to setup hosts.ini file

```bash
cd 001-ansible && ansible-playbook -u ubuntu -i hosts.ini deploy.yml --become
```