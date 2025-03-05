# repo.fish

A Fish shell plugin to simplify git repository management.

## Features

- Clone repositories with a consistent directory structure
- Navigate to repositories quickly
- Create new git repositories
- Open repositories in your browser
- List all your repositories
- Customizable hooks for post-clone, post-goto, and post-new actions

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install abs3ntdev/repo.fish
```

## Usage

### Basic Commands

```fish
# Clone a repository
repo get github.com/user/repo

# Navigate to a repository
repo go github.com/user/repo

# Create a new repository
repo new github.com/user/myrepo

# Open current repository in browser
repo open

# Clone an AUR repository
repo aur package-name

# List all repositories
repo list

# Show help
repo help
```

### Configuration

By default, all repositories are stored in `~/repos`. You can change this by setting the `$REPO_BASE_DIR` variable in your `config.fish`:

```fish
set -gx REPO_BASE_DIR ~/path/to/repos
```

### Custom Hooks

repo.fish provides three hooks that you can customize:

1. **Post-clone hook**: Runs after cloning a repository
2. **Post-goto hook**: Runs after navigating to a repository
3. **Post-new hook**: Runs after creating a new repository

To use hooks, define the following functions:

```fish
# Define a custom post-clone hook
function repo_post_clone
    echo "Repository cloned to: $argv[1]"
    # Your custom actions here
    cd $argv[1]
    # You can run additional commands like:
    # npm install
    # bundle install
    # etc.
end

# Define a custom post-goto hook
function repo_post_goto
    echo "Navigated to: $argv[1]"
    # Your custom actions here
    cd $argv[1]
    # You can run additional commands like:
    # git status
    # ls -la
    # etc.
end

# Define a custom post-new hook
function repo_post_new
    echo "Created new repository at: $argv[1]"
    # Your custom actions here
    cd $argv[1]
    # You can run additional commands like:
    # touch README.md
    # git add README.md
    # git commit -m "Initial commit"
    # etc.
end
```

If you don't define these functions, the default behavior is to change to the repository directory.

## License

MIT
