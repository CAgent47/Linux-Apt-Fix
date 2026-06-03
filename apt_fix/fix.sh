#! /bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2207
# shellcheck disable=SC2034
# shellcheck disable=SC2181

function Enter() {
    for i in {1..2}; do
        echo " "
    done
}

installation() {
    for pkgs in "$@"; do
        if ! command -v "$pkgs" &> /dev/null; then
            sudo apt install "$pkgs"
        fi
    done
}

randomMessages() {
    quotes=(
        "Linux: Freedom to choose!"
        "Linux: Power at your fingertips!"
        "Linux: Where coders feel at home."
        "Linux: Stability meets felexibility."
        "Linux: Open-source, Open Possibilities"
    )

    random_index=$((RANDOM % ${#quotes[@]}))
    echo -e "\e[36m${quotes[$random_index]}\e[0m" 
}

installation libnotify-bin jq
notify-send "Relax And Wait a Few Minutes For Your Apt To Be Fix"

# Read & Execute Commands From json File

# ======================================================
# ============ Reading & Executing Commands ============

jq -r '.commands[]' config.json | while read -r cmd; do
    echo ">> Running $cmd"
    eval "$cmd"
    if [ $? -ne 0 ]; then
        echo "ERROR >> $cmd "
    fi
    echo " "
done

# ======================================================
# ======================================================

# Message Finished job Time
echo -e "\e[42mLinux:\e[0m  \e[31mApt Process Completed\e[0m \e[95m(Errors Fixed & Packages Upgraded)\e[0m"

Enter

echo -e "\e[46m=========================================\e[0m"
randomMessages
echo -e "\e[46m=========================================\e[0m"

Enter

echo -e "\e[45mCreated By CAgent_47\e[0m"


# Scripted By CAgent_47
