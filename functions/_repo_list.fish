function _repo_list
    find "$REPO_BASE_DIR" -type d -name ".git" -printf "%h\n" 2>/dev/null | sed 's|.*/||; s/\./_/g'
end
