function addr -a iface -d 'Shows the IPv4 addresses for the given interface'
    test -z $iface; and set -l iface -a

    ifconfig $iface | awk '/inet .* broadcast/ { print $2; }'
end
