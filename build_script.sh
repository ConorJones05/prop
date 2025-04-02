#!/bin/bash

echo "Starting build process..."
mkdir -p build

# Install html validator if needed
if ! command -v html-validate &> /dev/null; then
    echo "Installing html-validator..."
    npm install -g html-validate
fi

# Validate HTML files
echo "Validating HTML files..."
html_validation_result=$(html-validate index.html)
validation_status=$?

if [ $validation_status -ne 0 ]; then
    echo "HTML validation failed:"
    echo "$html_validation_result"
    echo "Build failed due to HTML errors!"
    exit 1
fi

# If validation passes, copy files to build directory
echo "Copying files to build directory..."
cp index.html build/
echo "Build completed successfully!"
exit 0
