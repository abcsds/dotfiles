Using vim8's plugin manager:

```
git submodule add https://github.com/scrooloose/nerdtree.git vim/vim.symlink/pack/pkg/start/nerdtree
git add .gitmodules vim/vim.symlink/pack/pkg/start/nerdtree
git commit
```

Update:
```
git submodule update --remote --merge
git commit
```
