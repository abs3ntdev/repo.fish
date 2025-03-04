function _repo_goto
    if test -z "$argv[1]"
        echo "Error: Repository path is required"
        return 1
    end

    set cleaned (_repo_clean_path $argv[1])
    set output_path "$REPO_BASE_DIR/$cleaned"
    # Remove .git suffix if present
    set trimmed (string replace -r '(\.git)$' '' "$output_path")
    _repo_post_goto $trimmed
end
