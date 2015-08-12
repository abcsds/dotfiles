## Wait, you're not done! Do this:

#### Install iTerm Solarized Colors
YADR will install Solarized colorschemes into your iTerm. Go to Profiles => Colors => Load Presets to pick Solarized Dark.

#### Remap caps-lock to escape with [Seil](https://pqrs.org/osx/karabiner/seil.html.en)
The escape key is the single most used key in vim.  Old keyboards used to have Escape where Tab is today. Apple keyboards are the worst with their tiny Esc keys. But all this is fixed by remapping Caps to Escape.  If you're hitting a small target in the corner, you are slowing yourself down considerably, and probably damaging your hands with repetitive strain injuries.

#### Set up a system wide hotkey for iTerm (Keys=>Hotkey)
Recommended Cmd-Escape, which is really Cmd-Capslock.

#### In iTerm, uncheck "Use Lion-style full screen" on General
This will give you fast full screen windows that are switchable without switching to spaces.

#### in MacVim, uncheck Prefer native fullscreen under Advanced settings
Same as iTerm. The Lion style spaces navigation slows everything down for no reason.

## If you want to run vim in terminal

* Make sure you install Solarized colorscheme in your terminal!
* If you don't want to use solarized terminal, then make sure you do this:

      let g:yadr_using_unsolarized_terminal = 1
      # in ~/.vimrc.before

* If you want to use an alternate colorcheme like Gruvbox, then in your `~/.vimrc.after` do:

      let g:yadr_disable_solarized_enhancements = 1
      colorscheme base16-twilight

## Vim - What's included?

 * [Navigation - NERDTree, EasyMotion, CtrlP and more](doc/vim/navigation.md)
 * [Text Objects - manipulate ruby blocks, and more](doc/vim/textobjects.md)
 * [Code manipulation - rails support, comments, snippets, highlighting](doc/vim/coding.md)
 * [Utils - indents, paste buffer management, lots more](doc/vim/utils.md)
 * [General enhancements that don't add new commands](doc/vim/enhancements.md)

A list of some of the most useful commands that YADR provides in vim are
included below. This is not a comprehensive list. To get deeper knowledge,
practice a few of these every day, and then start looking into the lists
of plugins above to learn more.

#### Navigation

 * `,z` - go to previous buffer (:bp)
 * `,x` - go to next buffer (:bn)
 * `Cmd-j` and `Cmd-k` to move up and down roughly by functions (`Alt` in Linux)
 * `Ctrl-o` - Old cursor position - this is a standard mapping but very useful, so included here
 * `Ctrl-i` - opposite of Ctrl-O (again, this is standard)

#### Search/Code Navigation

 * `,f` - instantly Find definition of class (must have exuberant ctags installed)
 * `,F` - same as `,f` but in a vertical split
 * `,gf` or `Ctrl-f` - same as vim normal gf (go to file), but in a vertical split (works with file.rb:123 line numbers also)
 * `gF` - standard vim mapping, here for completeness (go to file at line number)
 * `K` - Search the current word under the cursor and show results in quickfix window
 * `,K` - Grep the current word up to next exclamation point (useful for ruby foo! methods)
 * `Cmd-*` - highlight all occurrences of current word (similar to regular `*` except doesn't move)
 * `,hl` - toggle search highlight on and off
 * `,gg` or `,ag` - Grep command line, type between quotes. Uses Ag Silver Searcher.
 * `,gd` - Grep def (greps for 'def [function name]') when cursor is over the function name
 * `,gcf` - Grep Current File to find references to the current file
 * `//` - clear the search
 * `,,w` (alias `,<esc>`) or `,,b` (alias `,<shift-esc>`) - EasyMotion, a vimperator style tool that highlights jump-points on the screen and lets you type to get there.
 * `,mc` - mark this word for MultiCursor (like sublime). Use `Ctrl-n` (next), `Ctrl-p` (prev), `Ctrl-x`(skip) to add more cursors, then do normal vim things like edit the word.
 * `gK` - Opens the documentation for the word under the cursor.
 * Spacebar - Sneak - type two characters to move there in a line. Kind of like vim's `f` but more accurate.

#### File Navigation

 * `,t` - CtrlP fuzzy file selector
 * `,b` - CtrlP buffer selector - great for jumping to a file you already have open
 * `Cmd-Shift-M` - jump to method - CtrlP tag search within current buffer
 * `,jm` jump to models. Other `,j` mappings: `,jc` for controllers, `,jh` for helpers, etc. If you think of a concept and a letter, we've got you covered.
 * `Cmd-Shift-N` - NERDTree toggle (`Alt` in Linux)
 * `Ctrl-\` - Show current file in NERDTree
 * `Cmd-Shift-P` - Clear CtrlP cache

#### Better keystrokes for common editing commands

 * Ctrl-Space to autocomplete. Tab for snipmate snippets.
 * `,#` `,"` `,'` `,]` `,)` `,}` to surround a word in these common wrappers. the # does #{ruby interpolation}. works in visual mode (thanks @cj). Normally these are done with something like `ysw#`
 * `Cmd-'`, `Cmd-"`, `Cmd-]`, `Cmd-)`, etc to change content inside those surrounding marks. You don't have to be inside them (`Alt` in Linux)
 * `,.` to go to last edit location (same as `'.`) because the apostrophe is hard on the pinky
 * `,ci` to change inside any set of quotes/brackets/etc

#### Tabs, Windows, Splits

 * Use `Cmd-1` thru `Cmd-9` to switch to a specific tab number (like iTerm and Chrome) - and tabs have been set up to show numbers (`Alt` in Linux)
 * `Ctrl-h,l,j,k` - to move left, right, down, up between splits. This also works between vim and tmux splits thanks to `vim-tmux-navigator`.
 * `Q` - Intelligent Window Killer. Close window `wincmd c` if there are multiple windows to same buffer, or kill the buffer `bwipeout` if this is the last window into it.
 * `vv` - vertical split (`Ctrl-w,v`)
 * `ss` - horizontal split (`Ctrl-w,s`)
 * `,qo` - open quickfix window (this is where output from Grep goes)
 * `,qc` - close quickfix

#### Utility

 * `Ctrl-p` after pasting - Use `p` to paste and `Ctrl-p` to cycle through previous pastes. Provided by YankRing.
 * `,yr` - view the yankring - a list of your previous copy commands. also you can paste and hit `ctrl-p` for cycling through previous copy commands
 * `crs`, `crc`, `cru` via abolish.vim, coerce to snake_case, camelCase, and UPPERCASE. There are more `:help abolish`
 * `:NR` - NarrowRgn - use this on a bit of selected text to create a new split with just that text. Do some work on it, then :wq it to get the results back.
 * `,ig` - toggle visual indentation guides
 * `,cf` - Copy Filename of current file (full path) into system (not vi) paste buffer
 * `,cn` - Copy Filename of current file (name only, no path)
 * `,yw` - yank a word from anywhere within the word (so you don't have to go to the beginning of it)
 * `,ow` - overwrite a word with whatever is in your yank buffer - you can be anywhere on the word. saves having to visually select it
 * `,ocf` - open changed files (stolen from @garybernhardt). open all files with git changes in splits
 * `,w` - strip trailing whitespaces
 * `sj` - split a line such as a hash {:foo => {:bar => :baz}} into a multiline hash (j = down)
 * `sk` - unsplit a link (k = up)
 * `,he` - Html Escape
 * `,hu` - Html Unescape
 * `,hp` - Html Preview (open in Safari)
 * `Cmd-Shift-A` - align things (type a character/expression to align by, works in visual mode or by itself) (`Alt` in Linux)
 * `:ColorToggle` - turn on #abc123 color highlighting (useful for css)
 * `:Gitv` - Git log browsers
 * `,hi` - show current Highlight group. if you don't like the color of something, use this, then use `hi! link [groupname] [anothergroupname]` in your vimrc.after to remap the color. You can see available colors using `:hi`
 * `,gt` - Go Tidy - tidy up your html code (works on a visual selection)
 * `:Wrap` - wrap long lines (e.g. when editing markdown files)
 * `Cmd-/` - toggle comments (usually gcc from tComment) (`Alt` in Linux)
 * `gcp` (comment a paragraph)

#### Rails & Ruby

 * `,vv` and `,cc` to switch between view and controller - these are maps to :Rcontroller and :Rview. Explore the :R<Tab> family of commands for more fun from rails.vim!
 * `,rs` and `,rl` to run rspec or a spec line in iTerm (check iTerm window for results)
 * `,ss` and `,sl` for the same using `spring rspec` which makes your Rails specs faster by caching the Rails env (must have spring gem installed)
 * vim-ruby-refactoring - try `,rem`, `,rel` to extract methods or let statements
 * `Ctrl-s` - Open related spec in a split. Similar to :A and :AV from rails.vim but is also aware of the fast_spec dir and faster to type
 * `:Bopen [gem name]` to navigate to a gem (@tpope/vim-bundler)
 * `,gcp` - Grep Current Partial to find references to the current view partial
 * `,orb` - outer ruby block. takes you one level up from nested blocks (great for rspec)

#### Vim Dev

 * `,vc` - (Vim Command) copies the command under your cursor and executes it in vim. Great for testing single line changes to vimrc.
 * `,vr` - (Vim Reload) source current file as a vim file
