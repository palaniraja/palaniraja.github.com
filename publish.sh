#!/usr/bin

echo "[ 1/3 ] Going to remove previously generated files"
# to delete files that are generated (.git and .ignore as they are hidden)
rm -rf `ls | grep -v "CNAME\|hugo\|README.md\|publish.sh"`

# switch to hugo directory and run hugo to build genereate content in hugo/docs and move generated files back to ./
echo "[ 2/3 ] To build static contents and copy"
cd hugo && hugo && mv docs/* ../ && cd ..
echo "COMPLETE"

# git commit changes as "publish"
echo "[ 3/3 ] Commit changes and push to github"
git add .
git commit -m "publish"
git push origin --all

echo "COMPLETE"