component=catalogue
source common.sh

print_head Copy the repo file fo Mongo
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>$log_file
echo $?

nodejs_app_setup


print_head Install MongoDB
dnf install mongodb-mongosh -y &>>$log_file
echo $?


print_head Load MongoDB Masterdata
mongosh --host mongo-dev.bdevops.online </app/db/master-data.js &>>$log_file
echo $?





