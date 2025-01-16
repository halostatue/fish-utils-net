# @halostatue/fish-utils/functions/ports.fish:v2.0.0

function ports -d 'Shows processes listening on ports; options are passed to lsof'
    argparse h/help -- $argv
    or return 1

    if set --query _flag_help
        echo >&2 'Usage: '(status function)' [OPTION...]

Shows processes listening on ports. Any OPTIONs are passed to lsof.'
        return
    end

    lsof -iTCP -sTCP:LISTEN -P $argv
end
