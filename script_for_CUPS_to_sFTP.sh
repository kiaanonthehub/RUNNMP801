#Author : Kiaan Maharaj

#!/bin/bash

# Specify the directories to search for files
directories=(
    "/soc/shared/res/ps"
    "/soc/nmp/res/ps"
    "/soc/moto/res/ps"
    "/soc/wooltru/res/ps"
    "/soc/transmed/res/ps"
    "/soc/hms/res/ps"
    "/soc/hsaver/res/ps"
    "/soc/advice/res/ps"
    "/soc/mcare/res/ps"
    "/soc/mnet/res/ps"
)
# Loop through the directories
for directory in "${directories[@]}"; do
    echo "Processing directory: $directory"

    # Find files starting with "daily_batch" in the current directory
    files=("$directory"/daily_batch*)

    # Check if any files match the pattern
    if [ ${#files[@]} -gt 0 ]; then

        # Loop through the matching files
        for file in "${files[@]}"; do
            if [ -f "$file" ]; then

                # Extract the file name and extension
                filename=$(basename "$file")
                extension="${filename##*.}"
                filename="${filename%.*}"

                # Get the directory path of the file
                directory_path=$(dirname "$file")

                # Construct the new file name with the current date appended
                new_filename="${filename}_${current_date}.${extension}"

                # Move the file to the new location with the new name
                mv "$file" "$directory_path/$new_filename"

                echo "File moved aside: $filename -> $new_filename"
            fi
        done
    else
        echo "No files found starting with 'daily_batch' in $directory"
    fi
done
