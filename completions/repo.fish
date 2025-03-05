function __repo_commands
    echo "get\tClone a repository"
    echo "open\tOpen the repository in a browser"
    echo "aur\tClone an AUR repository"
    echo "list\tList all repositories"
    echo "go\tNavigate to a repository"
    echo "goto\tNavigate to a repository"
    echo "new\tCreate a new repository"
    echo "create\tCreate a new repository"
    echo "help\tShow help message"
end

function __repo_needs_command
    set -l cmd (commandline -opc)
    if test (count $cmd) -eq 1
        return 0
    end
    return 1
end

function __repo_using_command
    set -l cmd (commandline -opc)
    if test (count $cmd) -gt 1
        if test $argv[1] = $cmd[2]
            return 0
        end
    end
    return 1
end

function __repo_list_repos
    find "$REPO_BASE_DIR" -type d -name ".git" | path dirname | sort | path basename
end

# Main command completions
complete -f -c repo -n __repo_needs_command -a '(__repo_commands)'

# Repository completions
complete -f -c repo -n '__repo_using_command go; or __repo_using_command goto' -a '(__repo_list_repos)'

# Help option
complete -f -c repo -s h -l help -d 'Show help message'
