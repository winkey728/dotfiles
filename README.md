# My dotfiles

![Snapshot in Mac](http://ox8rz7kte.bkt.clouddn.com/images/dotfiles/mac.png?imageView2/2/w/650) 
Mac

![Snapshot in Linux](http://ox8rz7kte.bkt.clouddn.com/images/dotfiles/linux.png?imageView2/2/w/650)
Linux

## Getting Started

### Prerequisites
* Unix-like environment with ZSH installed and actived (macOS or Linux or even Cygwin)
* `git` > 1.7.x
* `python` > 3.5
* `pipenv` installed. Visit [Homepage](https://github.com/kennethreitz/pipenv) or [docs](https://docs.pipenv.org/) to learn how to use.

### Installation
Clone this repository wherever you want. (I would like to keep it in `~/projects/github/dotfiles`):
```
git clone https://github.com/winkey728/dotfiles.git ~/projects/github/dotfiles
```
Then run the install script (use Python):
```
cd ~/projects/github/dotfiles
pipenv install
pipenv run ./install.py
```
Finally run:
```
exec "$SHELL"
```
or restart the shell

## License
Released under [MIT License](https://github.com/winkey728/dotfiles/blob/master/LICENSE) 

