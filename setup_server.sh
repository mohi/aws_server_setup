echo 'copying display_system_info.sh file into ~'
cp files/display_system_info.sh ~

echo 'appending delta to bashrc'
cat files/bashrc_delta >> ~/.bashrc
