# install nginx
yum install -y yum-utils && \
cat <<EOF> /etc/yum.repos.d/nginx.repo
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
EOF && \
yum-config-manager --enable nginx-mainline && \
yum install nginx;

# install docker
curl -sSL https://get.docker.com/ | bash;

# install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose;

# install screen vim git zsh
yum install -y screen vim git zsh;

# install certbot
yum install epel-release && \
yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional && \
yum install certbot python2-certbot-nginx;
