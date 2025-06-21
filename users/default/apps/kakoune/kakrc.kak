# Most of this configurations are based on following link. Thank you!
#   https://frog.ski/blog/writing-your-first-kakrc

colorscheme gruvbox-dark

add-highlighter global/ number-lines -relative -hlcursor
add-highlighter global/ show-matching

set-option global tabstop 2
set-option global indentwidth 2
set-option global scrolloff 8,4

map global normal q b
map global normal Q B
map global normal <a-q> <a-b>
map global normal <a-Q> <a-B>

map global normal <esc> ";,"
map global normal <c-/> ":comment-line<ret>"

map -docstring "close current buffer" global user c ": db<ret>"
map -docstring "goto next buffer" global user n ": bn<ret>"
map -docstring "goto previous buffer" global user N ": bp<ret>"

define-command -docstring 'broese files' -params 0 fzf-files %{
  evaluate-commands %sh{
    if [ -z "''\${kak_client_env_TMUX}" ]; then
      printf 'fail "client was not started under tmux"\n'
    else
    	file="$(rg --files --color=always | fzf-tmux -p --ansi --query "$(python3 -c "import os,sys; result=os.path.relpath(sys.argv[1]); print('' if result=='.' else result)" "$(dirname "$kak_buffile")")")"
      if [ -n "$file" ]; then
        printf 'edit "%s"\n' "$file"
      fi
    fi
  }
}

map -docstring "open file" global user b ":fzf-files<ret>"

define-command -docstring 'Invoke fzf to open a file' -params 0 fzf-grep %{
  evaluate-commands %sh{
    if [ -z "''\${kak_client_env_TMUX}" ]; then
      printf 'fail "client was not started under tmux"\n'
    else
      RELOAD='reload:rg --color=always --column --smart-case {q} || :'
    	file="$(fzf-tmux -p --disabled --ansi --bind "start:$RELOAD" --bind "change:$RELOAD" | cut -d':' -f1)"
      if [ -n "$file" ]; then
        printf 'edit "%s"\n' "$file"
      fi
    fi
  }
}

map -docstring "grep files" global user g ":fzf-grep<ret>"

define-command -docstring 'Invoke fzf to select a buffer' fzf-buffer %{
  evaluate-commands %sh{
    BUFFER=$(
      (
        eval "set -- $kak_buflist"
        while [ $# -gt 0 ]; do
          printf "%s\0" "$1"
          shift
        done
      ) |
      fzf-tmux -p --read0
    )
    BUFFER=${BUFFER/\'/\'\'}
    if [ -n "$BUFFER" ]; then
      printf "buffer '%s'" "${BUFFER}"
    fi
  }
}

map -docstring "open buffer browser" global user B ":fzf-buffer<ret>"

define-command suspend-and-resume \
    -params 1..2 \
    -docstring 'suspend-and-resume <cli command> [<kak command after resume>]: backgrounds current kakoune client and runs specified cli command.  Upon exit of command the optional kak command is executed.' \
    %{ evaluate-commands %sh{

    # Note we are adding '&& fg' which resumes the kakoune client process after the cli command exits
    cli_cmd="($1) && fg"
    post_resume_cmd="$2"

    # automation is different platform to platform
    platform=$(uname -s)
    case $platform in
        Darwin)
      	    automate_cmd="sleep 0.01; osascript -e 'tell application \"System Events\" to keystroke \"${cli_cmd}\n\"'"
            kill_cmd="/bin/kill"
            break
            ;;
        Linux)
            automate_cmd="sleep 0.2; xdotool type '$cli_cmd'; xdotool key Return"
            kill_cmd="/usr/bin/kill"
            break
            ;;
    esac

    # Uses platforms automation to schedule the typing of our cli command
    nohup sh -c "$automate_cmd"  > /dev/null 2>&1 &
    # Send kakoune client to the background
    $kill_cmd -SIGTSTP $kak_client_pid

    # ...At this point the kakoune client is paused until the " && fg " gets run in the $automate_cmd

    # Upon resume, run the kak command is specified
    if [ ! -z "$post_resume_cmd" ]; then
        echo "$post_resume_cmd"
    fi
}}

define-command claude %{
  suspend-and-resume "claude"
}
