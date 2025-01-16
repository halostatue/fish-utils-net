# @halostatue/fish-utils/functions/dig1.fish:v2.0.0

function dig1 -d 'Shorter results from dig'
    dig +noauthority +noadditional +noqr +nostats +noidentify +nocmd \
        +noquestion +nocomments $argv
end
