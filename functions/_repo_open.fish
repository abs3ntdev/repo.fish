function _repo_open
    set remote (git remote get-url origin)
    set remote (string replace -r "git@" "https://" $remote)
    set remote (string replace --max=1 ":" "/" $remote)
    xdg-open "$remote"
end
