#!/bin/bash

# Echo Script - Demonstrates various echo functionalities
# Usage: ./echo_script.sh [options] [text]

# Function to display help
show_help() {
    echo "Echo Script - Advanced echo functionality"
    echo "Usage: $0 [OPTIONS] [TEXT]"
    echo ""
    echo "OPTIONS:"
    echo "  -h, --help      Show this help message"
    echo "  -n              Don't output trailing newline"
    echo "  -e              Enable interpretation of backslash escapes"
    echo "  -c, --color     Enable colored output"
    echo "  -b, --banner    Display text as banner"
    echo "  -r, --repeat N  Repeat text N times"
    echo "  -f, --file      Read from file and echo contents"
    echo ""
    echo "EXAMPLES:"
    echo "  $0 \"Hello World\""
    echo "  $0 -c \"Colored text\""
    echo "  $0 -b \"BANNER TEXT\""
    echo "  $0 -r 3 \"Repeat me\""
    echo "  $0 -e \"Line 1\\nLine 2\\nLine 3\""
}

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to create banner text
create_banner() {
    local text="$1"
    local length=${#text}
    local border=$(printf "%-${length}s" | tr ' ' '=')

    echo "╔═${border}═╗"
    echo "║ ${text} ║"
    echo "╚═${border}═╝"
}

# Function to echo with colors
echo_colored() {
    local colors=($RED $GREEN $YELLOW $BLUE $PURPLE $CYAN)
    local text="$1"
    local color_index=$((RANDOM % ${#colors[@]}))
    echo -e "${colors[$color_index]}${text}${NC}"
}

# Parse command line arguments
NEWLINE=true
ESCAPES=false
COLOR=false
BANNER=false
REPEAT=1
FROM_FILE=false
TEXT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -n)
            NEWLINE=false
            shift
            ;;
        -e)
            ESCAPES=true
            shift
            ;;
        -c|--color)
            COLOR=true
            shift
            ;;
        -b|--banner)
            BANNER=true
            shift
            ;;
        -r|--repeat)
            REPEAT="$2"
            if ! [[ "$REPEAT" =~ ^[0-9]+$ ]]; then
                echo "Error: Repeat count must be a number" >&2
                exit 1
            fi
            shift 2
            ;;
        -f|--file)
            FROM_FILE=true
            FILE_PATH="$2"
            shift 2
            ;;
        -*)
            echo "Unknown option: $1" >&2
            show_help
            exit 1
            ;;
        *)
            TEXT="$*"
            break
            ;;
    esac
done

# Handle file input
if [[ "$FROM_FILE" == true ]]; then
    if [[ -f "$FILE_PATH" ]]; then
        TEXT=$(cat "$FILE_PATH")
    else
        echo "Error: File '$FILE_PATH' not found" >&2
        exit 1
    fi
fi

# If no text provided and not reading from file, read from stdin
if [[ -z "$TEXT" && "$FROM_FILE" == false ]]; then
    if [[ -t 0 ]]; then
        echo "Enter text (Ctrl+D to finish):"
    fi
    TEXT=$(cat)
fi

# Main echo logic
for ((i=1; i<=REPEAT; i++)); do
    if [[ "$BANNER" == true ]]; then
        create_banner "$TEXT"
    elif [[ "$COLOR" == true ]]; then
        echo_colored "$TEXT"
    else
        # Build echo command with options
        echo_cmd="echo"
        if [[ "$NEWLINE" == false ]]; then
            echo_cmd="$echo_cmd -n"
        fi
        if [[ "$ESCAPES" == true ]]; then
            echo_cmd="$echo_cmd -e"
        fi

        eval "$echo_cmd \"$TEXT\""
    fi

    # Add separator for multiple repetitions
    if [[ $REPEAT -gt 1 && $i -lt $REPEAT ]]; then
        echo "---"
    fi
done
