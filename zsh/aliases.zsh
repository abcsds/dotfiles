alias reload!='. ~/.zshrc'
test_colors() {
  for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
}
