#!/bin/bash

# Exit on error
set -e

echo "Setting up Executive AI Assistant..."

# Copy environment file if it doesn't exist
if [ ! -f .env ]; then
    echo "Creating .env file from template..."
    cp .env.example .env
    echo "Please edit .env with your configuration"
fi

# Install dependencies if needed
if [ -f "pyproject.toml" ]; then
    echo "Installing Python dependencies..."
    pip install -e .
fi

# Setup Gmail integration if script exists
if [ -f "scripts/setup_gmail.py" ]; then
    echo "Setting up Gmail integration..."
    python scripts/setup_gmail.py
fi

# Setup cron jobs if script exists
if [ -f "scripts/setup_cron.py" ]; then
    echo "Setting up cron jobs..."
    python scripts/setup_cron.py
fi

echo "Setup complete! Don't forget to:"
echo "1. Configure your .env file"
echo "2. Set up your API keys" 