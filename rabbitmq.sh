source common.sh

print_head Copy rabbitmq repo file
cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo &>> $log_file


print_head install rabbitmq
dnf install rabbitmq-server -y &>> $log_file


print_head enable and restart rabbitmq services
systemctl enable rabbitmq-server
systemctl restart rabbitmq-server

print_head create an application user
rabbitmqctl add_user roboshop roboshop123 &>> $log_file

rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>> $log_file
