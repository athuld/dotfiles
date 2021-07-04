
# Dotfiles

Personal configs and scripts for my dwm setup managed using stow

Stow is a symlink farm manager which is great for managing dotfiles

```bash
sudo pacman -S stow
```


## Usage

All the dotfiles can be deployed with a single command 
```bash
cd dotfiles/
stow -vSt ~ *
```

or Indivial configs can be deployed 


Eg:  To deploy nvim config

```bash
cd dotfiles/
stow -vSt ~ nvim
```

  
## Credits

- [merothh](https://www.github.com/merothh) for helping out to make my  dwm better
- [LukeSmithxyz](https://github.com/LukeSmithxyz) for inspiring with his dwm videos and scripts