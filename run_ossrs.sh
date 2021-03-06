FILE_NAME="main.conf"
if [ -n "$1" ];
then
	FILE_NAME=$1
fi
docker ps -a | awk '{ print $1,$2 }' | grep ossrs/srs | awk '{print $1 }' | xargs -I {} docker rm -f {} | awk '{ print $1,$2 }' | grep ossrs/srs | awk '{print $1 }' | xargs -I {} docker rm -f {}
docker run -d -p 1935:1935 -p 1985:1985 -p 8080:8080 -p 8085:8085 -v $PWD/$FILE_NAME:/usr/local/srs/conf/srs.conf ossrs/srs:3
