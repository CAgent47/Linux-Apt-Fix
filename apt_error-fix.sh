#! /bin/bash

echo -e "\e[42mFixing Your Linux Pleas Wait.....\e[0m"
# To Remove DPKG/APT That incomplete
sudo killall apt-get
sudo rm -f /var/lib/dpkg/lock-frontend /var/lib/dpkg/lock
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock

# Configuring all Installed Packages
sudo dpkg --configure -a

# Fix problematic dependencise And repair packages
sudo apt --fix-broken install -y

# Update & Upgrade
sudo apt update && sudo apt upgrade -y

# System Status
if ! command -v fastfetch &> /dev/null; then
    sudo apt install fastfetch -y
fi

for i in {1..2}; do
    echo " "
done

# Message Finished job Time
echo -e "\e[42mLinux:\e[0m  \e[31mApt Process Completed\e[0m \e[95m(Errors Fixed & Packages Upgraded)\e[0m"

for i in {1..2}; do
    echo " "
done

echo -e "\e[46m=========================================\e[0m"
quotes=(
    "Linux: Freedom to choose!"
    "Linux: Power at your fingertips!"
    "Linux: Where coders feel at home."
    "Linux: Stability meets felexibility."
    "Linux: Open-source, Open Possibilities"
)

random_index=$((RANDOM % ${#quotes[@]}))
echo -e "\e[36m${quotes[$random_index]}\e[0m" 
echo -e "\e[46m=========================================\e[0m"
for i in {1..2}; do
    echo " "
done

echo -e "\e[45mCreated By CAgent_47\e[0m"
sleep 5
reboot

# Scripted By CAgent_47
