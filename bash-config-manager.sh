#!/bin/bash

bash_config_manager() {
    # First argument must be a directory to look in for the target .*rc file
    if [ -z "$1" ]; then
        echo "Missing required argument at position 0: 'rc_dir'!"
        return 0
    fi

    if [ -d "$1" ]; then
        # Second argument must be the name of the .*rc file to use
        if [ -z "$2" ]; then
            echo "Missing required argument at position 1: 'rc_file'!"
            return 0
        elif [ "${2::${#2}<1?0:1}" = "." ] && [ "${2:${#2}<2?0:-2}" = "rc" ]; then
            rc_path="$1/$2"
            echo "$rc_path"
        else
            echo "Invalid target .*rc file for argument at position 1: '$2'!"
            #echo "First Comparison Split:  ${2::${#2}<1?0:1}"
            #echo "Second Comparison Split: ${2:${#2}<2?0:-2}"
            return 0
        fi
    else
        echo "Invalid target directory for argument at position 0: '$1'!"
        return 0
    fi
}

bash_config_manager "test_install_dir" ".testrc"

