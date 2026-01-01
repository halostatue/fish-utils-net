# @halostatue/fish-utils/functions/man.cx.fish:v2.0.0

function man.cx -d 'Open a manpage in man.cx'
    # Copyright (c) 2010 by Ryan Tomayko <https://tomayko.com/about>
    # This is Free Software distributed under the terms of the MIT license
    argparse h/help -- $argv
    or return 1

    if ! set --query argv[1] || set --query _flag_help
        echo >&2 'Usage: man.cx [SECTION] topic...

Open manpage TOPIC on https://man.cx. When SECTION is given, it must begin
with a numeric value. Multiple TOPICs may be specified.'

        set --query _flag_help
        return
    end

    set --function url https://man.cx/
    set --function section

    for page in $argv
        if string match --quiet --regex '^\d' $page
            set section (string escape --style url "($page)")
            continue
        end

        open $url$page$section
        sleep 0.5
    end
end
