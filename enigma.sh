#!/usr/bin/env bash

# Constants
FILENAME_REGEX="^[a-zA-Z.]+$"
MESSAGE_REGEX="^[A-Z ]+$"

# Menu Window
show_menu() {
    echo -ne "
0. Exit
1. Create a file
2. Read a file
3. Encrypt a file
4. Decrypt a file
Enter an option:
"
}

# Function to read user input with a prompt
read_input() {
    local prompt=$1
    read -r -p "$prompt" input
    echo "$input"
}

# Function to validate file name
is_valid_filename() {
    [[ $1 =~ $FILENAME_REGEX ]]
}

# Function to validate message
is_valid_message() {
    [[ $1 =~ $MESSAGE_REGEX ]]
}

# Function to create a file
create_file() {
    local filename=$(read_input "Enter the filename: ")

    if is_valid_filename "$filename"; then
        local message=$(read_input "Enter a message: ")

        if is_valid_message "$message"; then
            echo "$message" > "$filename" && echo -e "\nThe file was created successfully!\n" || echo -e "\nError: Failed to write to file.\n"
        else
            echo -e "\nThis is not a valid message!\n"
        fi
    else
        echo -e "\nFile name can contain letters and dots only!\n"
    fi
}

# Function to read a file
read_file() {
    local filename=$(read_input "Enter the filename: ")

    if [[ -f "$filename" ]]; then
        echo -e "\nFile content:\n"
        cat "$filename"
    else
        echo -e "\nFile not found!\n"
    fi
}

# Function to encrypt a file
encrypt_file() {
    local filename=$(read_input "Enter the filename: ")

    if [[ -f "$filename" ]]; then
        local password=$(read_input "Enter password: ")
        local output_file="${filename}.enc"

        openssl enc -aes-256-cbc -e -pbkdf2 -nosalt -in "$filename" -out "$output_file" -pass pass:"$password" &>/dev/null
        local exit_code=$?

        if [[ $exit_code -ne 0 ]]; then
            echo -e "\nFail\n"
        else
            rm -f "$filename"
            echo -e "\nSuccess\n"
        fi
    else
        echo -e "\nFile not found!\n"
    fi
}

# Function to decrypt a file
decrypt_file() {
    local filename=$(read_input "Enter the filename: ")

    if [[ -f "$filename" ]]; then
        local password=$(read_input "Enter password: ")
        local decrypted_filename=$(echo "$filename" | sed 's/.enc$//')

        openssl enc -aes-256-cbc -d -pbkdf2 -nosalt -in "$filename" -out "$decrypted_filename" -pass pass:"$password" &>/dev/null
        local exit_code=$?

        if [[ $exit_code -ne 0 ]]; then
            echo -e "\nFail\n"
        else
            rm -f "$filename"
            echo -e "\nSuccess\n"
        fi
    else
        echo -e "\nFile not found!\n"
    fi
}

# Main program loop
echo "Welcome to the Enigma!"

while true; do
    show_menu
    choice=$(read_input)

    case $choice in
        0) echo -e "\nSee you later!\n"; break ;;
        1) create_file ;;
        2) read_file ;;
        3) encrypt_file ;;
        4) decrypt_file ;;
        *) echo -e "\nInvalid option!\n" ;;
    esac
done