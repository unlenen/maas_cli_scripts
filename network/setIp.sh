PROFILE_NAME=$1
MAAS_URL=$2
API_KEY=$3

MACHINE_NAME=$4
MACHINE_IP=$5
MACHINE_INTERFACE_NAME=$6
MAAS_FABRIC_NAME=$7
MAAS_IP_SUBNET=$8


function printJsonParam(){
	echo $1 | jq ''$2'' |sed 's#"##g'
}

function main(){

	source ../login.sh

	machine=$(maas $PROFILE_NAME machines read| jq -c '.[]| {id:.system_id, name: .hostname }' | grep $MACHINE_NAME)

	id=$(printJsonParam "$machine" '.id')
	name=$(printJsonParam "$machine" '.name')
	interfaces=$(maas $PROFILE_NAME interfaces read ${id})
		

	maas_interface=$(echo $interfaces | jq -c ".[] | {id:.id, name:.name }" | grep "${MACHINE_INTERFACE_NAME}")
	maas_interface_id=$(printJsonParam "$maas_interface" '.id')
	maas_interface_name=$(printJsonParam "$maas_interface" '.name')

	maas_fabric_vlan_id=$(maas $PROFILE_NAME fabrics read | jq ".[] | {name:.name, vlans:.vlans[] | {id:.id, vid:.vid}}" -c | grep "${MAAS_FABRIC_NAME}" | jq '.vlans.id')
	echo "MAAS NET { vlan_id: $maas_fabric_vlan_id ,'id': '${maas_interface_id}' , 'name': '${maas_interface_name}', ip: ${maas_ip_address} }"
	maas $PROFILE_NAME interface update $id $maas_interface_id vlan=$maas_fabric_vlan_id | tr '\n' ' ' | grep -v '{'
	maas $PROFILE_NAME interface link-subnet $id $maas_interface_id mode=STATIC subnet=$MAAS_IP_SUBNET ip_address=${MACHINE_IP} | tr '\n' ' ' | grep -v '{'

}

main