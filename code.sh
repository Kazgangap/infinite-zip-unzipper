unzip file.zip
prev_file="file.zip"

while [ -f "$prev_file" ]
do
    echo "Contents of $prev_file:"
    unzip -l "$prev_file"

    curr_file=$(unzip -Z1 "$prev_file")
    unzip "$prev_file" -d "$(dirname "$prev_file")"
    rm "$prev_file"
    prev_file="$curr_file"

    if [ "$prev_file" = "stop.zip" ]; then
        break
    fi
done