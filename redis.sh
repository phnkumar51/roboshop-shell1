source common.sh

print_head Disable exisisting version of Redis
dnf module disable redis -y

print_head Enable Latest Version of Redis 7
dnf module enable redis:7 -y

print_head Install Redis
dnf install redis -y

print_head Update config file of Redis
sed -i -e 's|127.0.0.1|0.0.0.0|' -e '/protected-mode/ c protected-mode no' /etc/redis/redis.conf


print_head Restart Redis
systemctl enable redis
systemctl restart redis