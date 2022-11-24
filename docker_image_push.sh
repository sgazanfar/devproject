#!  /bin/bash
profile="default"
region="us-east-2"

echo "$1"
echo "$2"
echo "$3"

if [[ -n "$1" ]]; then
  profile="$1"
fi

if [[ -n "$2" ]]; then
  region="$2"
fi

if [[ -n "$3" ]]; then
  region="$3"
fi


aws ecr get-login-password --region "${region}" --profile "${profile}" | docker login --username AWS --password-stdin "074108680633.dkr.ecr.${region}.amazonaws.com"
docker build -t "devproject" .
docker tag "devproject:latest 074108680633.dkr.ecr.us-east-2.amazonaws.com/devproject:latest"
docker push "074108680633.dkr.ecr.us-east-2.amazonaws.com/devproject:latest"
