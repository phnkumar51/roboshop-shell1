# To print the colour follow the below syntax
# echo -e"\e[COLmxxxxx\e[0m


echo -e "\e[31mDisable Nginx\e[0m"
dnf module disable nginx -y >/tmp/roboshop.log


echo -e "\e[32mEnable Nginx\e[0m"
dnf module enable nginx:1.24 -y >/tmp/roboshop.log

echo -e "\e[33mInstall Nginx\e[0m"
dnf install nginx -y >/tmp/roboshop.log

echo -e "\e[34mcopy Nginx Conf file\e[0m"
cp nginx.conf /etc/nginx/nginx.conf >/tmp/roboshop.log

echo -e "\e[35mremove the old content in Nginx\e[0m"
rm -rf /usr/share/nginx/html/* >/tmp/roboshop.log

echo -e "\e[35mDownload Nginx content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip >/tmp/roboshop.log
cd /usr/share/nginx/html >/tmp/roboshop.log >/tmp/roboshop.log

echo -e "\e[35mDisable Nginx\e[0m"
unzip /tmp/frontend.zip >/tmp/roboshop.log

echo -e "\e[36mRestart Nginx\e[0m"
systemctl enable nginx >/tmp/roboshop.log
systemctl restart nginx >/tmp/roboshop.log

# environmental variables
# Input variables script Input variables
# We need to run the environmental variables before running the script
# echo x1 is $x1