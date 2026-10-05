set -g fish_greeting ""
#starship init fish | source

function fish_prompt
	#colors purple, cyan - blue, green
	set_color purple --bold
	echo -n ":3 "
	
	#set_color cyan --bold
	set_color magenta --bold
	echo -n (prompt_pwd)
	
	set_color normal
	echo -n " "
end


#its for opensuse
function s
    # Check if at least 2 arguments are passed and the first one is "z"
    if test (count $argv) -ge 2; and test "$argv[1]" = "z"
        switch $argv[2]
            case i
                sudo zypper install $argv[3..-1]
            case r
                sudo zypper remove $argv[3..-1]
            case up
                sudo zypper update $argv[3..-1]
            case ref
                sudo zypper refresh $argv[3..-1]
            case '*'
                # Fallback: pass everything directly to zypper for unhandled actions
                sudo zypper $argv[2..-1]
        end
    else
        echo "Error: Use 's z [i|r|up|ref]' or check your arguments."
    end
end

