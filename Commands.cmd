```shell
# Build Image
docker build -t xp .

# Run Container
docker run --name xp -p 9393:80 -d xp

docker exec -it xp bash

# Clean
docker rm -f $(docker ps --filter name=xp --format {{.ID}})
docker rmi xp
```

### Entry at Hosts File
```shell
sudo vi /etc/hosts
Line --> 127.0.0.1 site1.com
Line --> 127.0.0.1 site2.com
```