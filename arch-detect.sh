#!/bin/bash

ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    echo "x86_64-unknown-linux-gnu";
elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    echo "aarch64-unknown-linux-gnu";
else
    echo "Unsupported architecture: $ARCH";
    exit 1;
fi
