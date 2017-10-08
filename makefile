README.md: guessinggame.sh
	echo "# GUESSING GAME" > $@
	echo >> $@
	echo "- *Time Stamp at which make was run:*" >> $@
	date >> $@
	echo >> $@
	echo "- **Lines of code in guessinggame.sh:**" >> $@
	wc -l guessinggame.sh|egrep -o '[0-9]+' >> $@

all: $@

clean:
	rm $@
