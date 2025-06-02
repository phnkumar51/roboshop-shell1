# To print the colour follow the below syntax
# echo -e"\e[COLmxxxxx\e[0m

print_head(){
  echo -e "\e[36m$*\e[0m"
}
print_head Disable Default Nginx
dnf module disable nginx -y >>/tmp/roboshop.log


print_head Enable Nginx
dnf module enable nginx:1.24 -y >>/tmp/roboshop.log

print_head Install Nginx
dnf install nginx -y >>/tmp/roboshop.log

print_head copy Nginx Conf file
cp nginx.conf /etc/nginx/nginx.conf >>/tmp/roboshop.log

print_head remove the old content in Nginx
rm -rf /usr/share/nginx/html/* >>/tmp/roboshop.log

print_head Download Nginx content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip >>/tmp/roboshop.log
cd /usr/share/nginx/html >>/tmp/roboshop.log >>/tmp/roboshop.log

print_head Disable Nginx
unzip /tmp/frontend.zip >>/tmp/roboshop.log

print_head Restart Nginx\e
systemctl enable nginx >>/tmp/roboshop.log
systemctl restart nginx >>/tmp/roboshop.log

# environmental variables
# Input variables script Input variables
# We need to run the environmental variables before running the script
# echo x1 is $x1