POC of some things

cd slyness-data 
docker build -t slyness-data .

cd slyness-reporter
docker build -t slyness-reporter .

terraform apply -var="data_path=`pwd`/slyness-data/data"

 terraform destroy -var="data_path=`pwd`/slyness-data/data"