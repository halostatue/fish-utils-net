function connections --description 'Get open connections on a given port'
    lsof +c 0 -i :$argv[1] | grep ESTABLISHED
end
