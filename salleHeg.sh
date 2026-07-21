#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo -e "\033[0;33mUsage: $0 <room_number>\033[0m"
    exit 1
fi

ROOM_NUMBER=$1
URL="https://www.hesge.ch/heg/salle/$ROOM_NUMBER"  # Dynamic URL with room number

# Fetch the HTML content from the URL
RESPONSE=$(curl -s "$URL")

if [ -z "$RESPONSE" ]; then
    echo -e "\033[0;33mFailed to fetch data from $URL\033[0m"
    exit 1
fi

# Extract the information about room status using perl
ROOM_STATUS=$(echo "$RESPONSE" | perl -nle 'print $1 if /<h3 style=.*?>(.*?)<\/h3>/')

if [ -z "$ROOM_STATUS" ]; then
    echo -e "\033[0;33mFailed to extract room status.\033[0m"
    exit 1
fi

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'  # No Color

# Determine the color based on the room status
if [[ "$ROOM_STATUS" == *"Salle occupée"* ]]; then
    COLOR=$RED
elif [[ "$ROOM_STATUS" == *"Salle libre"* ]]; then
    COLOR=$GREEN
else
    COLOR=$YELLOW
fi

# Print the room status with the determined color
echo -e "Room Status: ${COLOR}$ROOM_STATUS${NC}"
