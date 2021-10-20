#!/bin/bash
USER="fpstech"
GROUP="fpstech"
PASS="Ch4ng3m3!!00"
# Generacion de usuario #
getent passwd $USER

if [ $? -ne 0 ] ; then
echo "User $USER no existe, Creando $USER"
useradd  $USER
usermod -a -G $GROUP $USER
chage -E -1 -M -1 $USER
echo $USER:$PASS | chpasswd
# SETEO DE SUDO #
cp /etc/sudoers /etc/sudoers.pre.alfred
echo -e "\n %"$USER" ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
else
echo " Usuario $USER existente cambiando contraseña y expiracion"
echo $USER:$PASS | chpasswd
chage -E -1 -M -1 $USER
fi

# CARGA KEYS SSH
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3gaDU5TXSCYmBb1GnjJ2y4hNfe0km1OdYKECrEAq0rouYCKLTtW0YrFqzdFzOnTK32p9pnT3ajfrwizMuoeA5e6CAZWsUerr34CAc5UIfi/yI5GWwnQJ+9nHudoYb+o1ltrPrFZmcQKP88nfVV4LEK07iylgxMV93kwl7UGeSLdOBO7LlR/GKqBWCIHmfOT1DwvZ0AwYXVGc1Usy5nQ2H9Huc6WV3t8inKydHktpVkYxCPOR7huJESa+KuHsGdQQBgeo2fJFWjScfKqKVuOvcvia4ccET5RFzSTcJqlczqc+eArAbssYoXntgPQMtKrEMZW1CTw7G7wOWL+GE9JLIMrtZd0xDdHCA+xbrbFJKCPBZ+Fld182JI4mMN889rSHzoZPlk8LgFG+yo77akqTv2Ds8wDNS7ogNjkkcs6ujnCxuXuSXXTdTvqu6KoloqXZL9E4LzV1LlSiY4W8QYbHmumPor0M6dQVY8N8Ae/KdH01yVB3g4HaPCKjj/dQQGyxG+ycC/2eL3xKUcpAzqhA34Uc1FtIQZC8TWiJntns1/bJs05Z3IP/F54WxAIfZe8Rqdc9hWtHpKv+hlQZp/MrP0lSPUO95NQMffeYlionvQM0LDL6Bi6ZEzEwgGU11fyH4y6Isv+7Ni9bfpaALQ6n9q7B7DeMSpEYn9JaKQnzjpw== alfred-ca@us-east-1
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCdaCheAWrxlcwr8R6Z7tt9PLmhh3cYcxo3MM9QjS3dNyC1wOmdQAVoOHSHVMb4/yqb7unNF6NDP6+M86LjJkPED7+OLloqmkc9+h6QzRhmizn32pycT+hXk6S1ghLO819z184TDglWqvwOmEgOsqXBD/H0OOMPzGkC+FVKSJKDyj4U6ARI7UN+a1jarle0HrhP1F9qmqmjxgxIQrMb23/JMx1KsXSRcjyEPFc0sFu10N626SYer9aeAqhIscLdpGPijer4tPT76keRQ5IiK+tOPDWRpAf9Sqpe0CugZcKuCge8QryxSFw/0AIDQewJGGumOzynB+u3VQCD+NS66CrxaBQyx5QqV2LAKUDjIZhLhQ4M62a79qqpyZ/fZva7a6ngvgWHr2X+oFCul4cn1Xm90iqeq05/HxLY7UxFNu45NcQsNW/aGWLRb9p3E8dEzO9fcShSE7lhlClpOQp4Eny6UJ+QLPmH8BEThh93uutuiOT66y0VjeKMtSTf8zOa+IgcSB2mo0+Om+fQETxwiJjQt6J8IsR0hQ/abBUdY8AGAb0Xx4Y5NYrDLl+q7EDSuxmTcf5P2hF9R2qlKzuwjBiUzpESgKfsZVWNNTQW77Wwj5Cc0PJLFnWI3klnKChv+Ql6321kjA/mADILvtt4MbcDdK6AGuuGRElBkOGm6gjzUQ== alfred-ca@us-east-2
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCKRv6qQVNKmEwPXpgk5rB1Qtuizr0p40wcTuuljcO1q7YYun3oKWU1mJIXCTJL3NtRfYMBeODK32VHQkQ+oo/MiYayD5JaWam7RCsRoI0HEUwSsHKoPCdIZxiVcD7ntlcbyArSkMBYw7oJFjprY+VI1yXp8+xYFXs9Iw8JYhL1xNWwn5jAmXsQKWxIUZcy+VKC2fVHptt7GIAqu4erDg7k+4qH/EBxcoh/KMuU/9eseWQWpp5QIFQK657CgQDFlHf+k9UtLMiUEARCz7nyu1YTd4QS6aD5Lm7PDF6xrcsWjAUwpt7UnAxjKoYpyXU5QB6Bu3tjvOAh5D2FGcCuGIUiDaZit+7m7KnvzMMPHlfk7fDV1l9oN3v8gZknO1rmO0vXi6RDCEcN2r721W8LOEE2+SfnMokrlYQBGeGiWdojxg0DN5Z4PGZii6T+wgJhKLufbfdF8VMNxoalhGZ7Px2rd7PoNdtiMx+Cle0IiBChw+/USh7XPpZSYtXx6Jj1yhHODW3Yq8A0sHy+BG5iaZORJjDT34cyzdEebOIFL+7l4ZvATWMdsoPsYG4PZp/CSulOSOndgryTlxc5a2AwKo3o2mmuAtffouFYGpqZlLG4l8+jAyKhx7aumZyjz70j00qZE1rMJJGzq2bNsyFZnzZIBpi9EcNc46XVm8/5h+vYXQ== alfred-ca-offline@us-east-1
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDW6+ZNRLWuEI9uENYzZ0zo9yPO8Dqo9QIWviorPFSlnDxtgVtLzQwSc7y+p17jueoGRQCmYlDCLITWBw8lZF9POXTwYnI7PVTe3VJncq/9fhv1236Spx56l3IaxsK0qSUGbb0SMD6Ar1by3OBhBNISM2r4PohKBy7bqSjpoj5Um3n0NSsAml15aAV+hOJMwiXg9PAP72iBZyxh8AjCLIvrFkm1laoqofGCwqoDjCi9FHu9iA9p7L4uCGbJMdekpQkn0nxYDoj/YTr+dL9WIxL+q03Kd9kMtDKXP3UtKgaU7L78zTTspyPhEsoLD91PummePJz+LmrIh0Ud6OqfE5OMboSOCwCgVL7v2cHEIlTaBPUy4G/kRkWYQjQZzhdpXevxc+I37SmwLFKAe9xoTqHpK06sYKBN+ASPQy4LD9VyxXQpzwdTcKESrFDCdFJpVlBUIbp67EEoMIDWBLxivNINKM5ZlyiYNnDNvjAdNPFtVokrh70shIPQjbsze6ZFtAqJUMbN97dAr9VcvqjaaS7unyGhiEruIkhZN02kNJk/bw27nayGPjNDKfXuB6fp7rtEZJ8sgSZS3AzK5FIwlekcKV2b1azIL8fq/xiIFZkGilKr/3OuasOKhk61z/f5KQwaHejBtDefsjTZoKmZ+27C3dklI9kHehXQKqWgL1qJ4w== alfred-ca-offline@us-east-2" | sudo tee /etc/ssh/alfred-ca.pub

#MODIFICACION CONFIGURACION
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.pre.alfred.old
sudo sed -i 's/^TrustedUserCAKeys.*//g' /etc/ssh/sshd_config
sudo sed -i 's/^### BEGIN TRUSTED KEYS.*//g' /etc/ssh/sshd_config
sudo sed -i 's/^### END TRUSTED KEYS.*//g' /etc/ssh/sshd_config
echo -e  "\n### BEGIN TRUSTED KEYS ###\nTrustedUserCAKeys /etc/ssh/alfred-ca.pub\n### END TRUSTED KEYS ###" |sudo tee -a /etc/ssh/sshd_config
echo " /etc/ssh/sshd_config modificado"

sudo systemctl restart sshd
echo "ssh reiniciado"
