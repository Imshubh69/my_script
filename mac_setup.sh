# setup homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# upgrade packages via homebrew 
brew update && brew upgrade

# install some pakages
brew install git clang fish

# install n for node version management
sudo npm i -g n

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# setup my git configs
git config --global user.name "Shubh"
git config --global user.email "vishwajitg471@gmail.com"

# add change id hook
git config --global init.templatedir '~/.git-templates'
mkdir -p ~/.git-templates/hooks
curl -Lo ~/.git-templates/hooks/commit-msg https://raw.githubusercontent.com/Imshubh69/my_script/main/commit-msg
chmod 755 ~/.git-templates/hooks/commit-msg

# setup oh my fish too
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# setup vim.plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# setup yarn-s script to use yarn berry instead oflegacy yarn 1 in repo

function yarn-s
rm -rf node_modules yarn.lock
yarn set version stable
echo '# yarn stuff
.pnp.*
.yarn/*
!.yarn/patches
!.yarn/plugins
!.yarn/releases
!.yarn/sdks
!.yarn/versions'>> .gitignore
end

funcsave yarn-s
