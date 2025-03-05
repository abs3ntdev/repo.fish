function _repo_list
    for git_dir in (find "$REPO_BASE_DIR" -type d -name ".git")
        set parent_dir (path dirname "$git_dir")
        echo (path basename "$parent_dir" | string replace -a "." "_")
    end
end
