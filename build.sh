docker build -t xp .

docker run --name xp -p 80:80 -d xp

echo "docker exec -it xp bash"