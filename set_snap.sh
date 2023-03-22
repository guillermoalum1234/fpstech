#!/bin/bash
#verificar parametro de entrada "snap_schedule" y "label environment"
if [ -z "$1" ] || [ -z "$2" ] ; then
  echo "Debe proporcionar el Snapshot schedule , el valor de la etiqueta 'environment' como argumentos."
  exit 1
fi

# Obtener los nombres de las VM que contienen la etiqueta "environment" igual al valor especificado
vm_names=$(gcloud compute instances list --filter="labels.environment=$2" --format="value(name)")

# Asignar la política de recursos a todos los discos persistentes asociados a cada VM
for vm_name in $vm_names
do
  zone=$(gcloud compute instances describe $vm_name --format="value(zone)")
# toma las URI de los discos asignados a la VM
  disk_uris=$(gcloud compute instances describe $vm_name --zone=$zone --format=json | jq -r '.disks[].source')

    # Ejecucion 

  for disk_uri in $disk_uris

  do
    # stripea el nombre del disco de la url y lo asigna a una variable
    disk_name=$(basename $disk_uri)
    # aplica la resource policie al disco 
    gcloud compute disks add-resource-policies $disk_name --resource-policies=$1 --zone=$zone
    # Imprimir un mensaje de confirmación
echo "Se ha asignado la política de recursos $1 a todos los discos asociados a las VM que contienen la etiqueta 'environment=$2' en la zona $zone
  done
done
