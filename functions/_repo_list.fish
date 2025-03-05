function _repo_list
    find "$REPO_BASE_DIR" -type d -name ".git" -printf "%h\n" 2>/dev/null | while read -l dir
        echo (string replace -a '.' '_' (basename "$dir"))
    end
end
