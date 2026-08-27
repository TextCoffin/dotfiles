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
