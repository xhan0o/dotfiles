<img src="extra/logo.png" alt="dotfiles logo" width="400">

Your dotfiles are how you personalize your system. These are mine.

If you're interested in the philosophy behind why projects like these are awesome, you might want to [read @holman's post on the subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## Installation

```bash
git clone --recursive git://github.com/decached/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow zsh
stow vim  # and so on
```

This will clone, symlink the appropriate files in `dotfiles` to your home directory. Everything is configured and tweaked within `~/dotfiles`.

Next, you will have to copy *my* zsh theme to `~/.zprezto`

```bash
cp ~/dotfiles/extra/prompt_decached_setup ~/.zprezto/modules/prompt/functions/
```

## What's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser above and see what components may mesh up with you. [Fork it](https://github.com/decached/dotfiles/fork), remove what you don't use, and build on what you do use.

## Bugs

I want this to work for everyone; that means when you clone it down it should work for you. That said, I do use this as *my* dotfiles, so there's a good chance I may break something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please [open an issue](https://github.com/decached/dotfiles/issues) on this repository and I'd love to get it fixed for you!

## License

This is [MIT](http://decached.mit-license.org) with no added caveats, therefore feel free to use this without linking back to me or using a disclaimer or anything silly like that.

## Thanks

Say Hi [@decached](https://twitter.com/decached)