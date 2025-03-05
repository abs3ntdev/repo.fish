function _repo_clean_path
    set stripped $argv[1]

    for prefix in "http://" "https://" "git@" "ssh://" "aur@"
        if string match -q "$prefix*" $stripped
            set stripped (string replace -r "^$prefix" "" $stripped)
        end
    end

    set stripped (string replace --max=1 ":" "/" $stripped)

    if not string match -q "*/*" $stripped
        set stripped "github.com/$stripped"
    end
    echo $stripped
end
