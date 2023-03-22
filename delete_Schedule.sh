#!/bin/bash

# Verificar si se ha proporcionado el nombre de la política de recursos como un parámetro
if [ -z "$1" || -z "$2" ]; then
  echo "Debe proporcionar el nombre de la política de recursos para eliminar  y la zona a utilizar"
  exit 1
fi

# Obtener una lista de todos los discos en el proyecto actual
disks=$(gcloud compute disks list --format="value(name)")

# Para cada disco, eliminar la política de recursos especificada en ese disco en su zona correspondiente
for disk in $disks; do
  name=$(echo $disk | cut -d ' ' -f 1)
  #"zone=$(echo $disk | cut -d ' ' -f 2)"
  echo "Eliminando la política de recursos $1 para el disco $name en la zona $2 "
  gcloud compute disks remove-resource-policies $name --resource-policies=$1 --zone $2  --quiet
done