#!/bin/bash

# sanity check
printf "Conda env: $CONDA_DEFAULT_ENV\n"
echo "Perl: "$(perl -v | head -n2 | tail -n1 | awk -F"(" '{print $2}' | awk -F")" '{print $1}')
echo "Perl location: "$(which perl)


# if the user submitted a ZIP file
if [ "$1" == "zip" ]
then
	# Set read headers
	if [ "$2" == "-fastq" ]
	then
		header="@"
	else
		header=">"
	fi

	# set temp file for read output
    # temp=$(mktemp /home/galaxy/galaxy/database/XXXXXX)
	temp=$(mktemp /data/files/XXXXXX)

	IFS=$'\n'
	# parse through the list zipped files
	for file in $(zipinfo -1 "$3")
	do
		IFS=$' \t\n'
		# check if the file matches the submitted sequence header ( > || @ )
		if [ $(unzip -p "$3" "$file" | head -n 1 | grep -o "^.") == "$header" ]
		then
			# write the first 25k num of reads (when dealing with fastq, less
			# if it is in fasta format) to the temp file
			unzip -p "$3" "$file" | sed -n '1,100000p' >> $temp
		fi
	done
	# remove all lines over 4mil (1 mil fastq reads max) in order to reduce computational time
	sed -i '4000000,$d' $temp

	# run the prinseq tools on the temp file
	prinseq-lite.pl "$2" $temp -out_good null -out_bad null -graph_data "$4" > /dev/null 2>&1
	# PCA plots dropped due to unavailability of perl module in Conda:
	prinseq-graphs-noPCA.pl -i "$4" -html_all -o "$4"	

	# move and remove the output and temp file
	mv "${4}.html" "$4"
	rm $temp
# if non zipped information is provided
else
	# run the prinseq tools
	prinseq-lite.pl "$2" "$3" -out_good null -out_bad null -graph_data "$4" > /dev/null 2>&1
	# PCA plots dropped due to unavailability of perl module in Conda:
	prinseq-graphs-noPCA.pl -i "$4" -html_all -o "$4"	
	# move the output files to the expected paths
	mv "${4}.html" "$4"
fi
