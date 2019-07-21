FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \
    && sed -i 's/Welcome to nginx/Hello from Docker container/g' /var/www/html/index.nginx-debian.html 

# forward request and error logs to docker log collector
# RUN ln -sf /dev/stdout /var/log/nginx/access.log \
#     && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80
CMD ["nginx"]


