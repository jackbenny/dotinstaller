dotinstaller
============

A simple dotfiles installer script.
I made this to speed up the process of installing my dotfiles repo on different computers and user accounts.

How does it work?
-----------------

The script takes the dotfiles from the current user's dotfiles directory ($HOME/dotfiles) and symlinks them to the user's home directory.
If the script finds that there is already a file with the same name, it moves that file to a backup directory ($HOME/dotbackups). If the script finds that there already exists a symlinked file with the same name to the dotfiles directory, it does nothing. If the symlink points a diffrent place, it removes the symlink.

What else is there to know?
---------------------------

I usually put the script in my $HOME/dotfiles directory and therefore the script ignores any files ending with .sh
I have also included a sample .vimrc file.
