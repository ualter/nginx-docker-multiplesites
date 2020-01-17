# NGINX Docker Multiplesites
Simple example how to create two sites in a NGINX Docker container.

The content of the sites are at the folders site1.com and site2.com, a simple index.html to differentiate each other.
```shell
./site1.com/index.html
./site2.com/index.html
```

Create the NGINX configuration for both sites, specifyng its domain and root location accordingly:
```shell
#site1.conf
server {
    listen       80;
    server_name  site1.com www.site1.com;

    location / {
        root   /usr/share/nginx/html/site1.com;
        index  index.html index.htm;
    }
}

#site2.conf
server {
    listen       80;
    server_name  site2.com www.site2.com;

    location / {
        root   /usr/share/nginx/html/site2.com;
        index  index.html index.htm;
    }
}
```

This Dockerfile will build our NGINX Mutiple site Docker Image, copying the site content and configuration properly at the NGINX server.
```shell
FROM nginx
RUN set -x \
    && apt-get update && apt-get upgrade -y
RUN mkdir -p /usr/share/nginx/html/site1.com
RUN mkdir -p /usr/share/nginx/html/site2.com
COPY site1.com /usr/share/nginx/html/site1.com
COPY site2.com /usr/share/nginx/html/site2.com
COPY site1.conf /etc/nginx/conf.d/
COPY site2.conf /etc/nginx/conf.d/
```

Building the Docker Image (the shell script build.sh can be used to get this things done)
```shell
#./build.sh
docker build -t xp .
docker run --name xp -p 80:80 -d xp
```
Add to the hosts file the two sites (*Attention!* This is for Mac or Linux, if you are using a Windows, the IP will be what the command "docker-machine ip" says.
```shell
127.0.0.1 localhost
127.0.0.1 site1.com
127.0.0.1 site2.com
```
Testing...
```shell
curl -s http://site1.com
```
```html
<html>
	<body>
		<h3>Hello there! I am the Alpha site, number 1</h3>
	</body>
</html>
```
```shell
curl -s http://site2.com
```
```html
<html>
	<body style="background-color: gray;">
		<h3>Hello there! I am the Beta site, number 2</h3>
	</body>
</html>
```

That's it!

To erase everything, run the clean.sh shell script to erase all.
```shell
./clean.sh
```
