source common.sh

print_head Install mysql server
dnf install mysql-server -y &>>$log_file


print_head enable and restart mysql
systemctl enable mysqld
systemctl restart mysqld

print_head Setup roboshop Root password
mysql_secure_installation --set-root-pass RoboShop@1 &>>$log_file
