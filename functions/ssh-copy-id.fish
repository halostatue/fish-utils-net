# @halostatue/fish-utils/functions/ssh-copy-id.fish:v2.0.0

# Shell script to install your public key on a remote machine. Takes the remote machine
# name as an argument. Obviously, the remote machine must accept password authentication
# or one of the other keys in your ssh-agent for this to work.
function ssh-copy-id -d 'Install your public key on a remote machine.'
    if ! argparse -N1 -xa,i h/help a-agent 'i-id=+' -- $argv
        ssh-copy-id::usage (status function) >&2
        return 1
    end

    if set --query _flag_help
        ssh-copy-id::usage (status function)
        return
    end

    if set --query _flag_id && set --query _flag_agent
        echo >&2 "Cannot use both --agent and --id flags."
        ssh-copy-id::usage (status function) >&2
        return 1
    end

    set --function files
    set --function identities

    if set --query _flag_id
        for pattern in $_flag_id
            for name in (eval echo $pattern)
                if ! string match --quiet --entire --regex '\.pub$' $name
                    if ! test -r $name.pub
                        echo >&2 Error: Identitfy file $name.pub does not exist.
                        return 1
                    end

                    set name $name.pub
                end

                set --append files $name
            end
        end

        for file in $files
            test -f $file
            and set -a identities (string escape (cat $file))
        end
    else if set --query _flag_agent
        if test -n "$SSH_AUTH_SOCK" && ssh-add -L >/dev/null 2>&1
            ssh-add -L | while read identity
                set --append identities (string escape $identity)
            end
        end
    else if test -f $HOME/.ssh/id_rsa.pub
        set identities $identities (string escape (cat $HOME/.ssh/id_rsa.pub))
    else if test -f $HOME/.ssh/id_dsa.pub
        set identities $identities (string escape (cat $HOME/.ssh/id_dsa.pub))
    end

    if not set -q identities[1]
        echo >&2 Error: No identities found.
        ssh-copy-id::usage (status function) >&2
        return 1
    end

    printf '%s\n' (string unescape $identities) |
        ssh $argv 'umask 077; test -d ~/.ssh || mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys'
    or return 10

    echo "Now try logging into the machine with \"ssh '$argv'\" and check in:

  ~/.ssh/authorized_keys

to make sure we haven't added extra keys that you weren't expecting.
"
end

function ssh-copy-id::usage
    echo "Usage: $argv[1] [[--id IDFILE]+|[--agent]] [user@]machine [ssh-args]
       $argv[1] -h|--help

Copies one or more SSH identities from this computer to the remote computer.

The flag '--id IDFILE' specifies a local identity file or a pattern of
identity files to be copied to the remote computer. If 'IDFILE' has a file
next to it called 'IDFILE.pub', the 'IDFILE.pub' file will be used for the
identity. '--id IDFILE' may be specified multiple times, but may not be used
with '--agent'.

The flag '--agent' specifies that 'ssh-agent -L' should be used to obtain
the identities that will be sent to the remote computer. Note that all
found identities will be sent. '--agent' cannot be used with '--id IDFILE'.

When neither '--id IDFILE' nor '--agent' have been specified, then one of
'~/.ssh/id_rsa.pub' or '~/.ssh/id_dsa.pub' will be used (in that order),
if they exist. If neither exists, an error will be raised.
"
end
