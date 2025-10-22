# Neovim installation
#export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
#export PATH="$PATH:/opt/pplatex-1.0-rc2/bin"
# vi mode
set -o vi
# Editor
case $(cat /etc/hostname) in
    Precision-5820-Tower-X-Series)
    export EDITOR=/opt/nvim/bin/nvim
    export VISUAL=/opt/nvim/bin/nvim
    export SUDO_EDITOR=/opt/nvim/bin/nvim
    export GIT_EDITOR=/opt/nvim/bin/nvim;;
    chamari)
    export EDITOR=/usr/bin/nvim
    export VISUAL=/usr/bin/nvim
    export SUDO_EDITOR=/usr/bin/nvim
    export GIT_EDITOR=/usr/bin/nvim;;
    nosike)
    export EDITOR=/usr/bin/nvim
    export VISUAL=/usr/bin/nvim
    export SUDO_EDITOR=/usr/bin/nvim
    export GIT_EDITOR=/usr/bin/nvim;;
    rimo)
    export EDITOR=/opt/nvim/bin/nvim
    export VISUAL=/opt/nvim/bin/nvim
    export SUDO_EDITOR=/opt/nvim/bin/nvim
    export GIT_EDITOR=/opt/nvim/bin/nvim
esac
