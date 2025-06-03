source common.sh

print_head Copy rabbitmq repo file
cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo &>> $log_file


print_head install rabbitmq
dnf install rabbitmq-&>>$log_file -y &>> $log_file


print_head enable and restart rabbitmq services
systemctl enable rabbitmq-&>>$log_file
systemctl restart rabbitmq-&>>$log_file

print_head create an application user
rabbitmqctl add_user roboshop roboshop123 &>> $log_file

rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>> $log_file
