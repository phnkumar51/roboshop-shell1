echo disable nginx
dnf module disable nginx -y

echo enable nginx
dnf module enable nginx:1.24 -y

echo install nginx
dnf install nginx -y

echo copy nginx configuration file
cp nginx.conf /etc/nginx/nginx.conf

echo remove old content on nginx
rm -rf /usr/share/nginx/html/*

echo download the content of nginx web server
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
cd /usr/share/nginx/html

echo extract app content
unzip /tmp/frontend.zip

echo restart nginx
systemctl enable nginx
systemctl restart nginx