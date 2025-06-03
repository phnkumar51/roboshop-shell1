component=shipping
source common.sh


app_prereq_setup
maven_app_setup

print_head Install Mysql Client
dnf install mysql -y

print_head Load Schema
mysql -h mysql-dev.bdevops.online -uroot -pRoboShop@1 < /app/db/schema.sql

print_head Create an app user
mysql -h mysql-dev.bdevops.online -uroot -pRoboShop@1 < /app/db/app-user.sql

print_head Load Master data
mysql -h mysql-dev.bdevops.online -uroot -pRoboShop@1 < /app/db/master-data.sql


