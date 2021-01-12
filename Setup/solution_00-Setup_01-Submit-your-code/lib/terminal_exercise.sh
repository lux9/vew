# tmp directory
mkdir tmp
cd tmp

# README file
touch README
stt

# level-1 directory
mkdir level-1
cd level-1
touch README-level1
pwd

# level-2 directory
cd ..
mkdir level-1/level-2
touch level-1/level-2/configuration

# playing with files
mv level-1/level-2/configuration level-1/
cd level-1
mv configuration config
ls
rmdir level-2
rm config

# Final words
cd
clear (or ctrl-l)
cat tmp/README
