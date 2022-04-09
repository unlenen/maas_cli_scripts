PROFILE_NAME=$1
MAAS_URL=$2
API_KEY=$3

source ../login.sh

for system_id in $(maas $PROFILE_NAME machines read| jq '.[].system_id'|sed 's#"##g'); do
       	maas $PROFILE_NAME machine deploy $system_id; 
done
