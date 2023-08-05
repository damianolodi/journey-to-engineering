---
author: Damiano Lodi
pubDatetime: 2022-10-03T07:00:00+02:00
title: My Ubuntu and MacOS Terminal Setup
postSlug: 2022-10-03-powerful-and-improved-ubuntu-terminal-setup-for-productive-people
featured: false
draft: false
tags:
  - terminal
  - setup
ogImage: ""
description: The default Ubuntu *Terminal* app is not that great. But it does take minimal effort to set up a few basic tools that will help shell productivity a lot.
---

The default Ubuntu _Terminal_ app is not that great (and probably the macOS' one is even worse). But it does take minimal effort to set up a few basic tools that will help _Terminal_ productivity a lot.

> My setup is based on the [Zsh](https://www.zsh.org/) shell, with the [Oh-My-Zsh](https://ohmyz.sh/) framework and the [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme. In addition, I use the following plugins:
>
> - [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
> - [macos](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos) or [ubuntu](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/ubuntu) (depending on the system you are using)
> - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
> - [zsh-completion](https://github.com/zsh-users/zsh-completions)
> - [zsh-syntax-highlighting](https://github.com/zsh-users/> zsh-syntax-highlighting)

In this guide, you will learn how to set up a similar configuration.

## Prerequisites

- This is not a tutorial on how to use the _Terminal_, I suppose that you already know the basics.
- You also need a working Linux system.
  - Most steps are almost identical if you are on macOS.
- Finally, you need _Git_ to install the _powerlevel10k_ theme and some _Zsh_ plugins.

## Zsh Setup

> You can skip this step if you are on macOS 10.15 (Catalina) or above: _Zsh_ is already the default shell.

Zsh is a shell that is built on top of _Bash_, the default Ubuntu shell. For most purposes, what you can do in _Bash_ you can do also in _Zsh_.

Use the following commands to install _Zsh_.

```bash
# List all the available shells
cat /etc/shells

# Install zsh
sudo apt install zsh

# Check the zsh path
which zsh
```

Once _Zsh_ is installed, you need to set it as the default shell. While there is a command to change the login shell, `gnome-terminal` will still default to use _Bash_[^1].

You can force it to use the new shell following these steps:

1. Open a new _Terminal_ window (`ctrl + alt + T`)
2. Click on `Terminal > Preferences` on the top left side of the screen.
3. Under `Profiles`, select `default` to modify the default profile.
4. Navigate to the `Command` tab
5. Check both boxes
   - _Run command as a login shell_
   - _Run a custom command instead of the login shell_
6. Write `zsh` in the _Custom command_ text box
7. Set the _When command exits_ dropdown menu to `Exit the terminal`
8. Close the preferences and the _Terminal_ window.

Next time you will open the tab, _Zsh_ will be used instead of _Bash_. From now on, shell configurations (aliases, etc.) should be added to the `.zshrc` file.

![Screenshot of the *Terminal* Settings pane](/assets/images/terminal-settings.png)

## Setup Oh-My-Zsh

_Oh-My-Zsh_ is an open-source framework to manage the _Zsh_ configuration. Briefly, it makes it easier to customize the shell configuration and install plugins.

Installation is quick: you need to paste a command into your _Terminal_. [Reference the documentation](https://ohmyz.sh/#install) to know which command you must use.

> [!note]
> The `.zshrc` file provided by _Oh-My-Zsh_ is very well commented and can offer details in case you get stuck during some customization.

## Install powerlevel10k Theme

_[powerlevel10k](https://github.com/romkatv/powerlevel10k)_ is a theme for the _Zsh_ shell: good customization, with tons of features that will help you when using _git_ or other tools. It is also very fast.

Also in this case, installation is really quick, you only need to clone a _git_ repo. [Check the documentation](https://github.com/romkatv/powerlevel10k#oh-my-zsh) to know the exact command for _Oh-My-Zsh_ users.

Once you cloned the repo, do the following:

1. Open a new _Terminal_ window.
2. Open the `.zshrc` file (for example with `nano .zshrc`).
3. Set the `ZSH_THEME` variable to `"powerlevel10k/powerlevel10k"`.
4. Close the editor (`ctrl + X` and `Y` in case of `nano`).

Once you reopen the _Terminal_ app, the theme configuration will take place. Follow the instructions and choose the settings you prefer.

> [!note]
> To change your settings later on, you can trigger the configuration process by typing `p10k configure`.

## Installing Plugins

There is a plethora of plugins for the _Zsh_ shell. I like to keep my list small, but [you can find the STANDARD plugin list on GitHub](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins).

The STANDARD plugins are the ones already installed with the _Oh-My-Zsh_ framework. To enable them:

1. Open the `.zshrc` file.
2. Search for the `plugins` variable (near the end of the file).
3. Add the list of plugins you want to use between parentheses, separated by a single space. In my case, I have

```bash
plugins=(git ubuntu)
```

There are also some other plugins, developed and supported by the community. To use them

1. Clone the plugin GitHub repo into `.oh-my-zsh/plugins/`.
2. Add the repo name to the `plugins` variable like with standard plugins.

I like to use the following plugins:

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) &rarr; fish-shell like syntax highlighting
- [zsh-completion](https://github.com/zsh-users/zsh-completions) &rarr; improve shell auto-completion
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) &rarr; improve auto-completion based on shell history

In the end, my `plugins` variable is

```bash
plugins=(git ubuntu zsh-autosuggestions zsh-completions zsh-syntax-highlighting)
```

## Conclusion

If you followed the complete tutorial, you should have a very fast and visually pleasing _Terminal_, with auto-completion and syntax highlight. You can go on to customize your setup as you prefer.

Enjoy!

[^1]: [_Ask Ubuntu_ source post](https://askubuntu.com/questions/342299/zsh-is-not-launched-while-opening-a-new-terminal-with-gnome-terminal)
