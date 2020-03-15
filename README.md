tmuxyank.vim
============

A vim shortcut to yank selected text (or movement) into tmux buffer.

This is inspired by [tbone.vim](https://github.com/tpope/vim-tbone).

This would allow you to yank a portion of the text you have in vim, into
tmux buffer.

Why?
====

For me, vim-tbone works perfectly, but the problem with it, is that it
depends on the write command, which only deals with lines, but if you
want to work on a portion of the text, you cannot just select a portion
of the text, and just yank it.

Options
=======

The only configuration for this, is the yank command to trigger it, by
default it's `<leader>ty`, but you can override that by setting the
variable `g:tmuxyank_map`.

```vim
let g:tmuxyank_map = '<leader>ty';
```
