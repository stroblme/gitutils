# Find last commit for the deleted file
git rev-list -n 1 HEAD -- $path

# Checkout the commit before the the delete happened
git checkout $commit^ -- $path

# Credits go to https://gist.github.com/infusion/b2cfefbea3fd0f601eec9755c69a7b66