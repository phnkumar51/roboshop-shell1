component=catalogue
source common.sh

cp mongo.repo /etc/yum.repos.d/mongo.repo
nodejs


dnf install mongodb-mongosh -y
mongosh --host mongo-dev.bdevops.online </app/db/master-data.js




