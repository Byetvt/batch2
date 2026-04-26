#
function hello() {
   echo "Hello, $1!"
}

#
function fnc_now() {
   a=$(date '+%F-%H-%M-%S') 
   echo $a
}

#same function in one line
function one_line_fnc_now2() {    a=$(date '+%F-%H-%M-%S') echo $a; }

## whereis function
function fr ()
{
echo "Starting from root, Looking for filespec: " $1
find / -name "$1" 2>&1 | grep -v 'Permission denied' | xargs ls -l
}

## search history for a command
function hgrep ()
{
history | grep $1
echo " === Use !# to execute command again (ex. !42)"
}

function set_prompt_old() {
   PS1="\u@\h \W]\$"
}

function set_prompt() {
PS1="\u@\h \w]\$"
}

function hunt_tv() {
freetuxtv -v --open-channel "Hunt Channel"
}

function make_pdf_monthly_calendar() {
  read -p "Enter a 4-digit year: " year

  # Check if it's exactly 4 digits
  if [[ ! "$year" =~ ^[0-9]{4}$ ]]; then
    echo "Error: Please enter a valid 4-digit year."
    return 1
  fi

  pcal 1 "$year" 12 -s 0.9:0.2:0.1/1.0:1.0:0.8 -o ${year}_monthly_color.ps
  ps2pdf "${year}_monthly_color.ps"
  
  ls -l ${year}_monthly_color.p*

# pcal 1 2025 12    -s 0.9:0.2:0.1/1.0:1.0:0.8  -o 2025_monthly_color.ps
}

function make_pdf_yearly_calendar() {
  read -p "Enter a 4-digit year: " year

  # Check if it's exactly 4 digits
  if [[ ! "$year" =~ ^[0-9]{4}$ ]]; then
    echo "Error: Please enter a valid 4-digit year."
    return 1
  fi

  pcal "$year" -w -s 0.9:0.2:0.1/1.0:1.0:0.8 -o ${year}_yearly_color.ps
  ps2pdf "${year}_yearly_color.ps"
  
  ls -l ${year}_yearly_color.p*

#pcal 2023 -w -s 0.9:0.2:0.1/1.0:1.0:0.8 -o 2023_yearly_color.ps
#ps2pdf 2023_yearly_color.ps
}

function make_pdf_cal() {
pcal 2023 -w -s 0.9:0.2:0.1/1.0:1.0:0.8 -o 2023_yearly_color.ps
ps2pdf 2023_yearly_color.ps
}

function functionaliaslist() {
    echo
    echo -e "\033[1;4;32m""Functions:""\033[0;34m"
    compgen -A function
    echo
    echo -e "\033[1;4;32m""Aliases:""\033[0;34m"
    compgen -A alias
    echo
    echo -e "\033[0m"
}

histme() {
    local ts="$(fnc_now)"
    local suffix="$1"
    local filename="history_${ts}"
    if [ -n "$suffix" ]; then
        filename="${filename}_${suffix}"
    fi
    filename="${filename}.txt"
    history 500 > "$filename"
    ls -l "$filename"
}

#
