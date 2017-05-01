#!/bin/bash
###########################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
###########################

###########################
#        Variables        #
###########################
dir=~/dotfiles/             				              #Dotfiles directory
olddir=~/dotfiles_old/      				              #Dotfiles backup directory
nonConfigs="Xresources bash_profile bashrc vimrc xinitrc" #All files not in the ./config folder
configdir=~/dotfiles/config/

###########################

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change into the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# Moves existing dots in homedir to dotfiles_old then creates symlinks for each 
# config file that does not reside in the .config folder
echo "Moving any existing dots from ~ to $olddir"
for file in $nonConfigs; do
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Moves existing dots in config to dotfiles_old/config then creates symlinks for each
# config file within the .config folder

#i3
mv ~/.config/i3/config ~/dotfiles_old/config/i3/config
echo "Creating symlink to i3 config in config directory"
ln -s $dir/config/i3/config ~/.config/i3/config

#polybar
mv ~/.config/polybar/config ~/dotfiles_old/config/polybar/config
echo "Creating symlink to polybar config and launch script in config directory"
ln -s $dir/config/polybar/config ~/.config/polybar/config
ln -s $dir/config/polybar/launch.sh ~/.config/polybar/launch.sh

#neofetch
mv ~/.config/neofetch/config ~/dotfiles_old/config/neofetch/config
echo "Creating symlink to neofetch config in config directory"
ln -s $dir/config/neofetch/config ~/.config/neofetch/config

