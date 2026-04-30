###
###
###
## create and append to bash_aliases file
#
###
###
## Run the functions
echo Run the functions
source bash_functions
fnc_now
###
#
#
#
#
alias bat='batcat'   # like cat, exe is batcat on UBU and MINT
alias c="clear"  
alias cl="clear; pwd; ls -l;"
alias envme='eval env > env_$(fnc_now).txt; ls -l env_$(fnc_now).txt'
alias findlargefiles="find / -xdev -type f -size +50M | xargs ls -lah"
alias getpassword='read -s -p "Enter password: " PASSWORD'
alias goetc="cd /etc/; pwd"
alias grub_backup='eval sudo cp -p /etc/default/grub /etc/default/grub_$(fnc_now); ls -l /etc/default/grub_$(fnc_now)'; 
alias hgrep="history 500 | grep $1"
alias hht="while  echo SERVER --  $(date) ; do sleep 300 ; done"
###alias histme='eval history 500 > history_$(fnc_now).txt ;ls -l history_$(fnc_now).txt'
alias list_grub_boot_entries="sudo awk -F\' '/menuentry / {print \$2}\' /boot/grub/grub.cfg"
alias ll="ls -alF"
alias localsend="flatpak run org.localsend.localsend_app"
alias lsd2="ls -dl */"
alias lsd3="ls -d -l */"
alias lsd="ls -trl| grep "^d""
alias lsft="ls -l --time-style=full-iso"
alias lsp="du -sh *" 
alias lss="ls -Srl"  
alias lst="ls -trl"  
alias myip="hostname && hostname -i && date +%m-%d-%Y"
alias myvars="env | grep aa"
alias mywebpage="xdg-open https://byetvt.github.io/My_Github_static_web_page/"
alias mywgetflatpak_export='wget --output-document export_flatpaks_ordered_to_screen.sh https://raw.githubusercontent.com/Byetvt/batch1/main/export_flatpaks_ordered_to_screen.sh'
alias mywgetflatpaks='wget --output-document bash_flatpaks https://raw.githubusercontent.com/Byetvt/batch1/main/bash_flatpaks'
alias mywgetaliases="wget --output-document bash_aliases https://raw.githubusercontent.com/Byetvt/batch1/main/bash_aliases"
alias mywgetbatch="wget --output-document batch100.sh https://raw.githubusercontent.com/Byetvt/batch1/main/batch100.sh;chmod 755 batch100.sh"
alias mywgetfunctions="wget --output-document bash_functions https://raw.githubusercontent.com/Byetvt/batch1/main/bash_functions"
alias mywgetnotes="wget --output-document bash_notes https://raw.githubusercontent.com/Byetvt/batch1/main/bash_notes"
alias mywgetall="mywgetbatch; mywgetaliases; mywgetfunctions; mywgetnotes; mywgetflatpak_export; mywgetflatpaks"
alias netdis="sudo netdiscover -r 192.168.1.1/24"
alias now="fnc_now"
alias nowdate='date +"%m-%d-%Y"'
alias nowtime='date +"%T"'
alias qalcme="qalc 3*9"
alias setfiletimestamp="touch -a -m -t 201512180130.09 fileName.ext"
alias sha="sha256sum garuda-cinnamon-linux-zen-231029.iso"
alias showallfunctionsource="declare -f"
alias showfunctions2="typeset -F"
alias showfunctions3="compgen -A function"
alias showfunctions="declare -F"
alias showfunctionsource='type "$1"'     # showfunctionsource funtion_name
alias showmounteddrives="df -h" 
alias sizeinmb="ls -lah" 
alias tfind='find / -name "filename*.*"'
alias up="uptime --pretty"
alias updme="sudo apt update; sudo apt upgrade -y"
alias whatos="cat /etc/os-release"
alias whatshell="echo $0"
alias xrdphow="echo xfreerdp /u:username /v:ipaddres /p:dollarPassword /cert:ignore"
#
#
CDPATH=$HOME
alias lssize="ls -lhSr"
alias upflat="sudo flatpak update"
alias mint_cinna_later_logout_now="cinnamon-session-quit --logout --no-prompt"
alias gnomeout="gnome-session-quit --logout --no-prompt"
alias getvulkan='vulkaninfo | grep "GPU id"'
#
#
###alias now='date +"%m-%d-%Y %T"'
#alias envme="env > env_$(now).txt"
#alias histme='history 500 > history_$(now).txt ;ls -l history_$(now).txt'
###
##################################################################
#unalias aliasname
#unalias foo
##################################################################
aaTEMP="/var/tmp"
export aaTEMP
##################################################################
# . .bashrc   <== to reload .bashrc++
