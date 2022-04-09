PROFILE_NAME=$1
MAAS_URL=$2
API_KEY=$3

VM_NAME=$4
VM_ARCH=$5
VM_PXE_INTERFACE_MAC=$6

IPMI_IP=$7
IPMI_USER=$8
IPMI_PASS=$9


source ../login.sh
maas $PROFILE_NAME machines create architecture=$VM_ARCH mac_addresses=$VM_PXE_INTERFACE_MAC hostname=$VM_NAME  power_parameters_power_driver=LAN_2_0 power_type=ipmi power_parameters_power_address=$IPMI_IP power_parameters_power_user=$IPMI_USER power_parameters_power_pass=$IPMI_PASS