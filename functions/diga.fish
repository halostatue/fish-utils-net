# @halostatue/fish-utils/functions/diga.fish:v2.0.0

function diga -d 'Simplified dig lookup'
    if ! set -q argv[1]
        echo >&2 (status function): expected host
        return 1
    end

    dig +nocmd $host any +multiline +noall +answer
end
