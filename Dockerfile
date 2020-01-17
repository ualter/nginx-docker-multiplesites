FROM nginx
RUN set -x \
    && apt-get update && apt-get upgrade -y
RUN mkdir -p /usr/share/nginx/html/site1.com
RUN mkdir -p /usr/share/nginx/html/site2.com
COPY site1.com /usr/share/nginx/html/site1.com
COPY site2.com /usr/share/nginx/html/site2.com
COPY site1.conf /etc/nginx/conf.d/
COPY site2.conf /etc/nginx/conf.d/