function _repo_clone
    argparse w/worktree= -- $argv
    
    if not set -q argv[1]; or test -z "$argv[1]"
        echo "Error: Repository path is required"
        return 1
    end

    set repo_prefix $argv[1]
    set repo_path $argv[2]
    set cleaned (_repo_clean_path $repo_path)
    set output_path "$REPO_BASE_DIR/$cleaned"
    # Remove .git suffix if present
    set trimmed (string replace -r '(\.git)$' '' "$output_path")

    mkdir -p "$trimmed"

    if not test -d "$trimmed/.git"
        set repourl (string replace --max=1 "/" ":" "$repo_prefix@$cleaned")
        echo "Cloning $repourl to $trimmed..."
        git clone "$repourl" "$trimmed"
    else
        echo "Repository already exists: $trimmed"
    end

    if set -q _flag_worktree
        set worktree_base_dir "$HOME/worktrees"
        set worktree_path "$worktree_base_dir/$cleaned/$_flag_worktree"
        
        mkdir -p (dirname "$worktree_path")
        
        if not test -d "$worktree_path"
            echo "Creating worktree '$_flag_worktree' at $worktree_path..."
            git -C "$trimmed" worktree add "$worktree_path" -b "$_flag_worktree"
        else
            echo "Worktree already exists: $worktree_path"
        end
        
        _repo_post_clone "$worktree_path"
    else
        _repo_post_clone "$trimmed"
    end
end