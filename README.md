Rob's dotfiles
---

Main sources of inspiration
- https://github.com/holman/dotfiles *[generally got me started.  topic-oriented.]*
- https://github.com/davidbrewer/xmonad-ubuntu-conf  *[very well documented xmonad setup]*

Feel free to use what you will.  Thank the guys above.

Design Goals:
---
I've extended the functionality here past what is typically in dotfile projects
to not only copy over dotfiles, but also install and configure
the entire environment. I was tired of
reconfiguring / reinstalling everything that I want each time I set up a new machine, and 
this seemed like a good solution.

 Things are organized so that I can install only the parts that 
I want based on the machine that I'm using. Its centered around topics, just like Holman's 
dotfile project, but it prompts you before you install each topic. This suits me well,
as I generally have a couple of distinct types of installs that I want to manage (desktop, laptop, VM),
and it doesn't make sense to install everything on each machine.

I used Holman's for quite a long time, but I figured it was about time I came up with my 
own.  His is also somewhat tilted towards ruby development, which I don't ever use.
I also decided to keep the scripts bourne-compatable -- mainly because
I wanted to practice writing scripts in that slightly more constricted (but univerally supported) shell.

Usage:
---

```sh

#install me

./install.sh

```

You will be prompted before each topic is installed.  I suggest that you take a look
at what the ```xmonad``` topic does before you give that a go, as it is mainly based on 
David Brewer's xmonad setup and hasn't been tested on anything other than Ubuntu 12.04.

For the dotfiles, it will prompt you if it finds that you already have any installed.

Extending:
---
To add another topic, just add a subdirectory for the topic.  ```install.sh``` will automatically
be executed within each directory.  Anything with a ```.symlink``` extension will automatically be symlinked
as a dotfile in your home directory.

