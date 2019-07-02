#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($DZSH/*) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;

if [[ $OS == "Darwin" ]]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
