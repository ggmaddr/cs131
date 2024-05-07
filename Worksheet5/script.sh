#!/bin/bash


total_lines=$(wc -l < "Global YouTube Statistics.csv")

# For loop from 2nd line to the last line
for ((i= 2; i <= total_lines; i++)); do
    # Read the line
    line=$(awk "NR == ${i} { print }" "Global YouTube Statistics.csv")

    # Extract country and category
    country=$(echo "$line" | cut -d ',' -f8)
    category=$(echo "$line" | cut -d ',' -f5)

    # Categorize 'United States'
    if [ "$country" == "United States" ]; then
        # Write the entry to the respective category file
	if [ "$category" == "Music" ] || [ "$category" == "Entertainment" ] || [ "$category" == "Gaming" ] || [ "$category" == "Comedy" ]; then
        	echo "$line" >> "United States/$category.txt"
    	fi
    fi
done

# Count lines of files
music_count=$(wc -l < "United States/Music.txt")
entertainment_count=$(wc -l < "United States/Entertainment.txt")
gaming_count=$(wc -l < "United States/Gaming.txt")
comedy_count=$(wc -l < "United States/Comedy.txt")

# Write counts to ws5.txt
echo "Number of entries in United States/Music.txt: $music_count" >> ws5.txt
echo "Number of entries in United States/Entertainment.txt: $entertainment_count" >> ws5.txt
echo "Number of entries in United States/Gaming.txt: $gaming_count" >> ws5.txt
echo "Number of entries in United States/Comedy.txt: $comedy_count" >> ws5.txt

