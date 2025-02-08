#!/bin/bash

# Function to perform the speed test
speedtest() {
    CONFIG=$(curl -s https://www.speedtest.net/speedtest-config.php)
    IP=$(echo "$CONFIG" | grep -o '<client ip="[^"]*' | cut -d'"' -f2)
    ISP=$(echo "$CONFIG" | grep -o 'isp="[^"]*' | cut -d'"' -f2)
    echo "Testing from $ISP ($IP)..."

    SERVERS=$(curl -s https://www.speedtest.net/speedtest-servers-static.php)
    SERVER=$(echo "$SERVERS" | grep -o '<server url="[^"]*' | cut -d'"' -f2 | head -n 1)
    SERVER_NAME=$(echo "$SERVERS" | grep -o 'name="[^"]*' | cut -d'"' -f2 | head -n 1)
    echo "Testing against $SERVER_NAME..."
    echo "server = $SERVER"

    echo ""
    echo "Testing download speed..."
    DOWNLOAD_SPEED=$(curl -s -w '%{speed_download}' -o /dev/null "$SERVER")
    echo ">> Download speed: $(echo "$DOWNLOAD_SPEED" | awk '{print $1 * 8 / 1000 / 1000 " Mbps"}')"

    echo "Testing upload speed..."
    UPLOAD_SPEED=$(curl -s -w '%{speed_upload}' -o /dev/null -F "file=@/dev/zero" "$SERVER")
    echo ">> Upload speed: $(echo "$UPLOAD_SPEED" | awk '{print $1 * 8 / 1000 / 1000 " Mbps"}')"
}

speedtest
