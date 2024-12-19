update_node_version() {
  if ! command -v fnm >/dev/null 2>&1; then
    echo -e "⚠️ \033[1;37mfnm\033[0m is not installed. Please install \033[1;37mfnm\033[0m to use this plugin."
    exit 1
  fi

  if [ -z "$FNM_DIR" ]; then
    echo -e "⚠️ \$FNM_DIR is not set. Please configure it correctly."
    exit 1
  fi

  DEFAULT_ALIAS_PATH="${FNM_DIR}/aliases/default"

  if [ -z "$DEFAULT_ALIAS_PATH" ]; then
    echo -e "⚠️ No default version set. Please use \033[1;37mfnm default\033[0m to set a default"
    exit 1
  fi

  current=$(fnm current)
  default=$("$DEFAULT_ALIAS_PATH/bin/node" -v)

  if [[ (-f .nvmrc && -r .nvmrc) || (-f .node-version && -r .node-version) || (-f package.json && -r package.json) ]]; then
    fnm use --install-if-missing --silent-if-unchanged 1>/dev/null
    project=$(fnm current)

    if [ "$current" != "$project" ]; then
      echo -e "ℹ️ Switched \033[1;32mnode\033[0m to \033[1;37m${project}\033[0m"
    fi
  elif [[ "$current" != "$default" ]]; then
    fnm use --install-if-missing "$default" 1>/dev/null
    echo -e "ℹ️ Switched \033[1;32mnode\033[0m to \033[1;37m${default}\033[0m (default)"
  fi
}

chpwd_functions=("${chpwd_functions[@]}" "update_node_version")
