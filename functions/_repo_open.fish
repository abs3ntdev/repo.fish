function _repo_open
    set remote (git remote get-url origin)
    set remote (string replace -r "git@" "https://" $remote)
    set remote (string replace --max=1 ":" "/" $remote)
    
    if not command -q xdg-open
        echo "Error: xdg-open command not found"
        return 1
    end
    
    if not xdg-open "$remote" 2>/dev/null
        echo "Error: Failed to open $remote"
        return 1
    end
end
