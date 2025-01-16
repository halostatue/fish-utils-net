# @halostatue/fish-utils/functions/tmpscp.fish:v2.0.0

function tmpscp --wraps scp -d 'Make a temporary connection to an implicitly trusted host'
    scp -o 'StrictHostKeyChecking no' -o 'UserKnownHostsFile /dev/null' $argv
end
