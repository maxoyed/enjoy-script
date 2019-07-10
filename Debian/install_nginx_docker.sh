# install nginx
apt install -y curl gnupg2 ca-certificates lsb-release && \
echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" \
| tee /etc/apt/sources.list.d/nginx.list && \
curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add - && \
apt update && \
apt install nginx && \
systemctl enable nginx && systemctl start nginx;

# install docker
curl -sSL https://get.docker.com/ | bash;

# install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose;

# install screen vim git zsh certbot
apt-get install screen vim git zsh certbot python-certbot-nginx -t stretch-backports -y;
