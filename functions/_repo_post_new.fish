function _repo_post_new
    if functions -q repo_post_new
        repo_post_new $argv
    else
        cd $argv[1]
    end
end
