function repo
    argparse h/help -- $argv
    or begin
        _repo_help
        return 1
    end

    if set -q _flag_help
        _repo_help
        return 0
    end

    if not set -q argv[1]
        _repo_help
        return 1
    end

    set -l cmd $argv[1]
    set -l arg $argv[2]

    switch $cmd
        case get
            _repo_clone git $arg
        case aur
            _repo_clone aur $arg
        case open
            _repo_open
        case list
            _repo_list
        case go goto
            _repo_goto $arg
        case new create
            _repo_new $arg
        case '*'
            echo "Unknown command: $cmd"
            _repo_help
            return 1
    end
end
