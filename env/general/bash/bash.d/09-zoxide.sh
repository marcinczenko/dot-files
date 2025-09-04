######################################################################################
# Original omarchy does some strange things with zoxide, effectively preventing it
# from learning. I am fixing it here.
#
# See: https://youtu.be/aghxkpyRVDY?si=dLZ2xHiHiLe8RWfz&t=533
######################################################################################

# Remove any system alias for cd (e.g. from /etc/bashrc)
unalias cd 2>/dev/null

# Let zoxide manage `cd`
eval "$(zoxide init --cmd cd bash)"

# use QT6 by default
export PATH=/usr/lib/qt6/bin:$PATH
