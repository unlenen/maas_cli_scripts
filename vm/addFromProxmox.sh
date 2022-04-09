PROFILE_NAME=$1
MAAS_URL=$2
API_KEY=$3

PROXMOX_HOST=$4
PROXMOX_USER=$5
PROXMOX_PASS=$6

source ../login.sh
maas $PROFILE_NAME machines add-chassis chassis_type=proxmox hostname=$PROXMOX_HOST username=$PROXMOX_USER password=$PROXMOX_PASS