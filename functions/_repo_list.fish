function _repo_list
    find "$REPO_BASE_DIR" -type d -name ".git" -printf "%h\n" | sed 's|.*/||; s/\./_/g'
end
