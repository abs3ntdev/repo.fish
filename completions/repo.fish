function __repo_commands
    echo get open aur list go goto new create help
end

function __repo_needs_command
    set -l cmd (commandline -opc)
    if test (count $cmd) -eq 1
        return 0
    end
    return 1
end

complete -f -c repo -n __repo_needs_command -a get -d "Clone a repository"
complete -f -c repo -n __repo_needs_command -a open -d "Open the repository in a browser"
complete -f -c repo -n __repo_needs_command -a aur -d "Clone an AUR repository"
complete -f -c repo -n __repo_needs_command -a list -d "List all repositories"
complete -f -c repo -n __repo_needs_command -a go -d "Navigate to a repository"
complete -f -c repo -n __repo_needs_command -a goto -d "Navigate to a repository"
complete -f -c repo -n __repo_needs_command -a new -d "Create a new repository"
complete -f -c repo -n __repo_needs_command -a create -d "Create a new repository"
complete -f -c repo -n __repo_needs_command -a help -d "Show help message"
