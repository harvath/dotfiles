# set symlinks
for filename in ~/dotfiles/files/*; do
  ln -s "~/dotfiles/files/$filename" "~/$filename";
done

