function _repo_new
    if not set -q argv[1]; or test -z "$argv[1]"
        echo "Error: Repository path is required"
        return 1
    end

    set cleaned (_repo_clean_path $argv[1])
    set output_path "$REPO_BASE_DIR/$cleaned"
    # Remove .git suffix if present
    set trimmed (string replace -r '(\.git)$' '' "$output_path")
    mkdir -p "$trimmed"

    if not test -d "$trimmed/.git"
        git init "$trimmed"
    else
        echo "Repository already exists: $trimmed"
    end

    _repo_post_new "$trimmed"
end