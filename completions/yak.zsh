if [[ ! -o interactive ]]; then
    return
fi

compctl -K _yak yak

_yak() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(yak commands)"
  else
    completions="$(yak completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
