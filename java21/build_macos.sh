set -e
rm -rf ./jdk-*
JDK_VER=21.0.8_9
wget --no-check-certificate \
     https://github.com/adoptium/temurin21-binaries/releases/download/jdk-`echo $JDK_VER | sed 's/_/%2B/g'`/OpenJDK21U-jdk_aarch64_mac_hotspot_${JDK_VER}.tar.gz
tar xzvf OpenJDK21U-jdk_aarch64_mac_hotspot_${JDK_VER}.tar.gz
rm -rf OpenJDK21U-jdk_aarch64_mac_hotspot_hotspot_${JDK_VER}.tar.gz
m=$(tr '\n' ',' < modules ) 
rm -rf ./openjdk
./jdk-`echo $JDK_VER | sed 's/_/+/g'`/Contents/Home/bin/jlink --output ./openjdk \
    --no-man-pages \
    --no-header-files \
    --compress=2 \
    --add-modules $m
ID=$(docker build . -q)
docker run --rm $ID java -version
echo "Docker image ID is $ID"
echo "Please run docker tag $ID <Your Image>:<Your Tag> for later usage."
