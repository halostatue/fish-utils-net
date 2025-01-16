# @halostatue/fish-utils/functions/sshfp.fish:v2.0.0

# author: Danny Fullerton - Mantor Organization www.mantor.org
# license: public domain
function sshfp -d 'A secure way to create SSHFP records'
    if ! set --query argv[1]
        echo >&2 Usage: (status function) FQDN
        return 1
    end

    set --function fqdn $argv[1]
    set --function ciphers rsa dsa ecdsa ed25519
    set --function hashes sha1 sha256

    for i in (seq 1 4)
        for j in (seq 1 2)
            set --local k /etc/ssh/ssh_host_{$ciphers[$i]}_key.pub
            if test -f $k
                set --local h $hashes[$j]

                string split --fields 2 ' ' <$k |
                    openssl base64 -d -A |
                    openssl dgst -$h |
                    string split --fields 2 ' ' |
                    string upper |
                    read --local sshfp

                echo $fqdn. IN SSHFP $i $j $sshfp
            end
        end
    end
end
