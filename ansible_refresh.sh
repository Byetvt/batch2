wget -O master.zip https://github.com/Byetvt/batch2/archive/refs/heads/master.zip && ls -l master.zip
unzip -o master.zip -d $HOME/ansible-config
#The * wildcard in bash does not match hidden files (files starting with a dot, like .git or .gitignore) by default.
mv $HOME/ansible-config/batch2-main/* $HOME/ansible-config/
#rm $HOME/ansible-config/batch2-main/.gitignore
#rmdir $HOME/ansible-config/batch2-main
rm -rf $HOME/ansible-config/batch2-main
