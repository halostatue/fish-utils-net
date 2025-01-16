# @halostatue/fish-utils/functions/run_from_ssh.fish:v2.0.0

function run_from_ssh -d 'Return true if this process was run from sshd'
    set --function ppid (ps -o ppid= $fish_pid)
    ps -x | string match --entire $ppid | string match --entire --quiet sshd
end
