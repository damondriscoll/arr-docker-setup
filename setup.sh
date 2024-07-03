#!/bin/bash

# Check if .env file exists
if [ -f .env ]; then
    # Read the .env file line by line
    while IFS='=' read -r key value; do
        # Skip empty lines and comments
        if [[ $key =~ ^[A-Za-z_][A-Za-z0-9_]*$ && -n $value ]]; then
            # Export variable
            export "$key"="$value"
        fi
    done < .env
    echo ".env file has been imported."
else
    echo "Error: .env file not found."
    exit 1
fi

mkdir $MEDIA
mkdir $APPDATA

cd $APPDATA

# Array of directory names
directories=("gluetun" "jellyfin" "jellyseerr" "prowlarr" "qbittorrent" "radarr" "sonarr")

# Loop through each directory name and create the directory
for dir in "${directories[@]}"; do
    mkdir -p "$dir"
done

echo "Appdata directories created!"
