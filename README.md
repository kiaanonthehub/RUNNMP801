# RUNNMP801
Shell Script that moves through different directories , identifying "dailyy_batch" files and moves them aside with an altered naming convention of {filename}_{sysdate}.{extension}


# Notes

# -f "$file" is a conditional statement that checks if the specified $file is a regular file.
# (i.e., not a directory, symbolic link, or other special file type).

# ${#files[@]} -gt 0, it checks if the length of the files array is greater than zero

# files array contains the filenames "file1.txt", "file2.txt", and "file3.txt", ${files[@]} will represent "file1.txt file2.txt file3.txt".
