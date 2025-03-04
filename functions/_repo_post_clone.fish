function _repo_post_clone
    if functions -q repo_post_clone
        repo_post_clone $argv[1]
    else
        cd $argv[1]
    end
end
