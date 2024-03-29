#!/bin/bash

################################################################################
#                                                                              #
# Copyright (C) 2013 Jack-Benny Persson <jack-benny@cyberinfo.se>              #
#                                                                              #
# This program is free software; you can redistribute it and/or modify         #
# it under the terms of the GNU General Public License as published by         #
# the Free Software Foundation; either version 2 of the License, or            #
# (at your option) any later version.                                          #
#                                                                              #
# This program is distributed in the hope that it will be useful,              #
# but WITHOUT ANY WARRANTY; without even the implied warranty of               #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the                 #
# GNU General Public License for more details.                                 #
#                                                                              #
# You should have received a copy of the GNU General Public License            #
# along with this program; if not, write to the Free Software                  #
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA      #
#                                                                              #
################################################################################

## Script for bootstrapping the installation of dotfile ##

for f in `ls $HOME/dotfiles --hide=*.sh`
do

	if [ -h $HOME/.$f ]
	then
		LINK=`ls -l $HOME/.$f | grep $HOME/dotfiles/$f`
		if [ $? -eq 0 ]
		then
			printf "$HOME/.$f is already symlinked to dotfiles/$f. "
			printf "Skipping\n"
		else
			printf "$HOME/.$f is symlinked to "
			ls -l $HOME/.$f | awk '{print $11}'
			printf "Removing current symlink\n"
			rm $HOME/.$f
		fi
	fi

	if [ -f $HOME/.$f ] && [ ! -h $HOME/.$f ]
	then
		printf "$HOME/.$f exists, moving to $HOME/dotbackups\n"
		if [ ! -d $HOME/dotbackups ]
		then
			mkdir $HOME/dotbackups
		fi
		mv $HOME/.$f $HOME/dotbackups/$f
	fi

if [ ! -f $HOME/.$f ]
then
	ln -s $HOME/dotfiles/$f $HOME/.$f
fi

done
