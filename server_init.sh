# install nginx
apt install -y curl gnupg2 ca-certificates lsb-release && \
echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    | tee /etc/apt/sources.list.d/nginx.list && \
curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add - && \
apt update && \
apt install nginx && \

# install docker
curl -sSL https://get.docker.com/ | sh && \

# install zsh
apt install zsh && \
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
