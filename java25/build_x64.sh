set -e
rm -rf ./jdk-*
# https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25%2B36/OpenJDK25U-jdk_x64_linux_hotspot_25_36.tar.gz
JDK_VER=25_36
wget --no-check-certificate \
     https://github.com/adoptium/temurin25-binaries/releases/download/jdk-`echo $JDK_VER | sed 's/_/%2B/g'`/OpenJDK25U-jdk_x64_linux_hotspot_${JDK_VER}.tar.gz
tar xzvf OpenJDK25U-jdk_x64_linux_hotspot_${JDK_VER}.tar.gz
rm -rf OpenJDK25U-jdk_x64_linux_hotspot_${JDK_VER}.tar.gz
m=$(tr '\n' ',' < modules ) 
rm -rf ./openjdk
./jdk-`echo $JDK_VER | sed 's/_/+/g'`/bin/jlink --output ./openjdk \
    --no-man-pages \
    --no-header-files \
    --compress=2 \
    --add-modules $m
ID=$(docker build . -q)
docker run --rm $ID java -version
echo "Docker image ID is $ID"
echo "Please run docker tag $ID <Your Image>:<Your Tag> for later usage."
