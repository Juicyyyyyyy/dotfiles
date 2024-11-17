#!/bin/bash

# Function to run a command and check its success
run_command() {
    local cmd="$1"

    echo "Running: $cmd"
    eval "$cmd"

    if [ $? -eq 0 ]; then
        echo "✅ Command succeeded: $cmd"
    else
        echo "❌ Command failed: $cmd"
        exit 1
    fi
}

# Commands to run
commands=(
    "chsh -s $(which zsh)"
    #"git config --global user.email 'you@example.com'"
)

echo "Setting config"
for cmd in "${commands[@]}"; do
    run_command "$cmd"
done

echo "🎉 All commands executed successfully!"
