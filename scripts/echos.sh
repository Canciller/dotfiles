blue='\e[34m'
yellow='\e[33m'
red='\e[31m'
green='\e[32m'
white='\e[0m'

function succ {
	echo -e "${green}$@${white}"
}

function info {
	echo -e "${blue}$@${white}"
}

function warn {
	echo -e "${yellow}$@${white}"
}

function error {
	echo -e "${red}$@${white}"
}
