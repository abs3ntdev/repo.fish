function _repo_clone
    if not set -q argv[2]; or test -z "$argv[2]"
        echo "Error: Repository path is required"
        return 1
    end

    set repo_prefix $argv[1]
    set cleaned (_repo_clean_path $argv[2])
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

    _repo_post_clone "$trimmed"
end