trap 'last_command=$BASH_COMMAND' DEBUG
trap 'echo $debug"\"${last_command}\" - the last command exited with code $?. $reset_colour"' EXIT