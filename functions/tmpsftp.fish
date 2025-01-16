# @halostatue/fish-utils/functions/tmpsftp.fish:v2.0.0

function tmpsftp --wraps sftp -d 'Make a temporary connection to an implicitly trusted host'
    sftp -o 'StrictHostKeyChecking no' -o 'UserKnownHostsFile /dev/null' $argv
end
