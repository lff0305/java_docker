set -e
rm -rf ./jdk-*
JDK_VER=17.0.12_7
wget https://github.com/adoptium/temurin17-binaries/releases/download/jdk-`echo $JDK_VER | sed 's/_/%2B/g'`/OpenJDK17U-jdk_x64_linux_hotspot_${JDK_VER}.tar.gz
tar xzvf OpenJDK17U-jdk_x64_linux_hotspot_${JDK_VER}.tar.gz
rm -rf OpenJDK17U-jdk_x64_linux_hotspot_${JDK_VER}.tar.gz
m=$(tr '\n' ',' < modules ) 
rm -rf ./openjdk
./jdk-`echo $JDK_VER | sed 's/_/+/g'`/bin/jlink --output ./openjdk \
    --no-man-pages \
    --no-header-files \
    --compress=2 \
    --add-modules $m
docker build .
