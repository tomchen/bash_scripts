#!/bin/bash

# store the current dir
CUR_DIR=$(pwd)

# message for all commits
MESSAGE="minor update"

# Let the person running the script know what's going on.
echo "Committing all changes for all repositories..."

# Find all git repositories and update it to the master latest revision
for i in $(find . -name ".git" | cut -c 3-); do
	echo "";
	echo $i;

	# We have to go to the .git parent directory to call the pull command
	cd "$i";
	cd ..;

	# add, commit and push
	git add .
	git commit -m "${MESSAGE}"
	git push

	# lets get back to the CUR_DIR
	cd $CUR_DIR
done

echo "Complete!"
