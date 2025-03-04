function _repo_list
    for git_dir in (find "$REPO_BASE_DIR" -type d -name ".git")
        set parent_dir (dirname "$git_dir")
        echo (basename "$parent_dir" | sed 's/\./_/g')
    end
end
