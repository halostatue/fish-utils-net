# @halostatue/fish-utils/functions/tmpssh.fish:v2.0.0

function tmpssh --wraps ssh -d 'Make a temporary connection to an implicitly trusted host'
    ssh -o 'StrictHostKeyChecking no' -o 'UserKnownHostsFile /dev/null' $argv
end
