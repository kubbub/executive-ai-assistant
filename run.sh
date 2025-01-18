#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change to the script directory
cd "$SCRIPT_DIR"

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "Error: .env file not found in $SCRIPT_DIR"
    exit 1
fi

# Load environment variables from .env file
set -a
source .env
set +a

# Verify OPENAI_API_KEY is set
if [ -z "$OPENAI_API_KEY" ]; then
    echo "Error: OPENAI_API_KEY is not set in .env file"
    exit 1
fi

# Export the variables explicitly
export OPENAI_API_KEY
export GEMINI_API_KEY
export LANGSMITH_API_KEY

echo "Environment variables loaded successfully"
echo "OPENAI_API_KEY is set: ${OPENAI_API_KEY:0:10}..."

# Run langgraph
langgraph dev 