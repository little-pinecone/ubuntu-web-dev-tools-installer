trap 'last_command=$BASH_COMMAND' DEBUG
trap 'echo $gray"\"${last_command}\" - the last command exited with code $?. $reset_colour"' EXIT