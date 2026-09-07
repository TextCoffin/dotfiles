function nbwatch
     if count $argv > /dev/null; watch $argv 'netbird status -d | grep -B 3 "Status: Connected" | grep -vE "Public key|Status" | sed "s/^--\$/  · · ·/"'; else; watch -n 1 'netbird status -d | grep -B 3 "Status: Connected" | grep -vE "Public key|Status" | sed "s/^--\$/  · · ·/"'; end; 
end
