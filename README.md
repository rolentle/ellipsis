# ellipsis...

What is ellipsis...? Ellipsis is fourth iteration of my dotfiles and explanation of everything in it. Traditionally I have been a bad developer and just added junk to my dotfiles by copy and pasting. Not understanding the things I was adding to my dotfiles caused them to easily break and I didn't understand why they broke or how to fix them.

## Terminals

~~While traditionally I have used [iTerm2](https://iterm2.com/) as my terminal, I am now experimenting with [kitty](https://sw.kovidgoyal.net/kitty/#) due to its [kittens](https://sw.kovidgoyal.net/kitty/#kittens) framework.~~

After further digging, kitty actively chooses not work with tmux which is dissapointing,[see here](https://sw.kovidgoyal.net/kitty/faq.html#i-am-using-tmux-and-have-a-problem). They may have valid points, however I am not yet willing to get rid of my workflow for those reasons. I am now switching to [Alacritty](https://github.com/alacritty/alacritty).

## Shell

I have gone with Zsh and specifically [Oh My Zsh](https://ohmyz.sh/). I looked into [Fish](https://fishshell.com/), however decided to stick with Zsh as it comes with Mac out of the box.

## Shell Colors

I have added [p10k](https://github.com/romkatv/powerlevel10k) for my colorscheme. I enjoyed it configuration wizard so I didn't have to mess with getting it just right now for.

## Text Editor

I am going with Neovim nightly, as it has treesitter and lsp. I prefer Neovim over Vim as it has lua support and has a more precise scope for its users.

## Plugin Package Manager

In the past I have used [vim-plug](https://github.com/junegunn/vim-plug), which has worked great, but I decided to experiment with [packer](https://github.com/wbthomason/packer.nvim) due to it being written in Lua and its robust feature set.

## Todos

[] Research plugins for Oh My Zsh

[] Deep dive ln

[] Deep dive Makefile

[] Deep LSP/Completion

[] Deep dive galaxyline

[] Review Primeagen video

  [] https://www.youtube.com/watch?v=w7i4amO_zaE
  [] https://github.com/ThePrimeagen/init.lua
  
[] Review TJ video

  [] https://www.youtube.com/watch?v=stqUbv-5u2s
