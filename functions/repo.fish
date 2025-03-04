function repo
    set cmd $argv[1]
    set arg $argv[2]

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
        case help -h -help --help
            _repo_help
        case '*'
            echo "Unknown command: $cmd"
            _repo_help
            return 1
    end
end
