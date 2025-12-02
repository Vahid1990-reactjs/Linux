#!/bin/bash
SOURCE="/home"
DEST="/backup"
NAME="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"
mkdir -p "$DEST"
tar -czf "$DEST/$NAME" "$SOURCE"
echo "Backup created: $DEST/$NAME"
