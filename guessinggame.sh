#!/usr/bin/env bash
# File: guessinggame.sh

no_files_guessed=0
no_files_actual=0
difference=0

# Function to calculate difference between actual and guessed no. of files
function next_guess {
	echo "Guess again:"
	read no_files_guessed
}

# 1. Count the number of files in the current directory
#    Excluding: Directories and Hidden files
no_files_actual=$(ls -p|grep -v '/$'|wc -l)

# 2. Ask the user to guess the number of files in the curret directory
echo "Guess the number of files in this directory and then press [ENTER]: "

# 3. Prompt the user for a guess
read no_files_guessed

# 4. Give user a clue to guess the correct no. if the initial guess is incorrect
while [[ $no_files_guessed -ne $no_files_actual ]]
do
	difference=$no_files_actual-$no_files_guessed
	if [[ $difference -le 10 ]] && [[ $difference -gt 0 ]]
	then
		echo "Your guess is low."
	elif [[ $difference -ge -10 ]] && [[ $difference -lt 0 ]]
	then
		echo "Your guess is high."
	elif [[ $difference -gt 10 ]]
	then
		echo "Your guess is too low."
	elif [[ $difference -lt -10 ]]
	then
		echo "Your guess is too high."
	fi
	next_guess
done

# 5. Congratulate the user for guessing the correct number
if [[ $no_files_guessed -eq $no_files_actual ]]
then
	echo "CONGRATULATIONS !!! Your guess is correct"
fi
