function _repo_worktree
    if not set -q argv[1]; or test -z "$argv[1]"
        echo "Error: Worktree name is required"
        return 1
    end

    set worktree_name $argv[1]

    # Check if we're in a git repository
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: Not in a git repository"
        return 1
    end

    # Get the git repository root
    set repo_root (git rev-parse --show-toplevel)
    
    # Get the remote URL to determine the cleaned path
    set remote_url (git remote get-url origin 2>/dev/null)
    if test -z "$remote_url"
        echo "Error: No origin remote found"
        return 1
    end
    
    # Clean the remote URL to get the path structure
    set cleaned (_repo_clean_path $remote_url)
    
    # Create worktree in ~/worktrees with the same structure
    set worktree_base_dir "$HOME/worktrees"
    set worktree_path "$worktree_base_dir/$cleaned/$worktree_name"
    
    mkdir -p (dirname "$worktree_path")
    
    if not test -d "$worktree_path"
        echo "Creating worktree '$worktree_name' at $worktree_path..."
        git worktree add "$worktree_path" -b "$worktree_name"
    else
        echo "Worktree already exists: $worktree_path"
    end
    
    _repo_post_clone "$worktree_path"
end