#---------------------------------Code---------------------------------------------

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

# Get the current date
current_date=$(date +%Y%m%d)

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

                # Construct the new file name with the current date appended
                new_filename="${filename}_${current_date}.${extension}"

                # Move the file to the new location with the new name
                mv "$file" "$directory/$new_filename"

                echo "File moved aside: $filename -> $new_filename"
            fi
        done
    else
        echo "No files found starting with 'daily_batch' in $directory"
    fi
done

#----------------------------------Notes-------------------------------------

# -f "$file" is a conditional statement that checks if the specified $file is a regular file.
# (i.e., not a directory, symbolic link, or other special file type).

# ${#files[@]} -gt 0, it checks if the length of the files array is greater than zero


# files array contains the filenames "file1.txt", "file2.txt", and "file3.txt", ${files[@]} will represent "file1.txt file2.txt file3.txt".