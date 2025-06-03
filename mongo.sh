source common.sh

print_head Copy MongoDB repo file
cp mongo.repo /etc/yum.repos.d/mongo.repo &>> $log_file

print_head Install mongodb
dnf install mongodb-org -y &>> $log_file

print_head Update mongo config file
sed -i -e's|127.0.0.1|0.0.0.0|' /etc/mongod.conf &>> $log_file

print_head restart Mongodb service
systemctl enable mongod
systemctl restart mongod
