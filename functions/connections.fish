# @halostatue/fish-utils/functions/connections.fish:v2.0.0

function connections -d 'Get open connections on a given port'
    if ! set --query argv[1]
        echo >&2 (status function): port missing
        return 1
    end

    lsof +c 0 -i :$port | grep ESTABLISHED
end
