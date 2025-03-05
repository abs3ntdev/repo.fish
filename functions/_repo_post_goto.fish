function _repo_post_goto
    if functions -q repo_post_goto
        repo_post_goto $argv[1]
    else
        cd $argv[1]
    end
end
