switch_n() {
  if [ ! "$(command -v n)" ]; then
    printf "n isn't installed\ny tho"
    exit 1
  fi

  if ! n auto 2>/dev/null
  then
    # no node version file found, checking if currently on LTS
    lts="v$(n --lts)"
    current=$(node --version)

    if [ "$lts" != "$current" ]; then
      # currently not on lts, switching
      echo "Currently not on node LTS, switching..."
      n lts
    fi
  fi
}

chpwd_functions=("${chpwd_functions[@]}" "switch_n")
