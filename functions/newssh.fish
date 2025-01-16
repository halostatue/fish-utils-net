# @halostatue/fish-utils/functions/newssh.fish:v2.0.0

function newssh --wraps ssh -d 'Make an initial first connection to a host.'
    ssh -o 'StrictHostKeyChecking no' $argv
end
