# To print the colour follow the below syntax
# echo -e"\e[COLmxxxxx\e[0m

print_head(){
  echo -e "\e[36m$*\e[0m"
  echo "################################" >>log_file
  echo -e "\e[36m$*\e[0m"
  echo "################################" >>log_file
}

log_file=/tmp/roboshop.log
rm -f $log_file
print_head Disable Default Nginx
dnf module disable nginx -y $&>> $log_file


print_head Enable Nginx
dnf module enable nginx:1.24 -y $&>> $log_file

print_head Install Nginx
dnf install nginx -y $&>> $log_file

print_head copy Nginx Conf file
cp nginx.conf /etc/nginx/nginx.conf $&>> $log_file

print_head remove the old content in Nginx
rm -rf /usr/share/nginx/html/* $&>> $log_file

print_head Download Nginx content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip $&>> $log_file
cd /usr/share/nginx/html >>/tmp/roboshop.log $&>> $log_file

print_head Disable Nginx
unzip /tmp/frontend.zip $&>> $log_file

print_head Restart Nginx\e
systemctl enable nginx $&>> $log_file
systemctl restart nginx $&>> $log_file

# environmental variables
# Input variables script Input variables
# We need to run the environmental variables before running the script
# echo x1 is $x1