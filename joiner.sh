#!/bi/bash

# Renaming .blv files to .flv
for file in *.blv
do
  mv "$file" "${file%.blv}.flv"
done

cat /dev/null > ff.txt

# loop through in correct order and append
for i in `ls -1 *.flv | sort -n`; do
    echo "file '${i}'" >> ff.txt;
done

# Actual joining and conversion from .flv to .mp4
ffmpeg -f concat -i ff.txt -c copy ../output.mp4

rm ff.txt

printf "success"