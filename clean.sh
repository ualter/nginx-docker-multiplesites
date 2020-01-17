docker rm -f $(docker ps --filter name=xp --format {{.ID}})
docker rmi xp