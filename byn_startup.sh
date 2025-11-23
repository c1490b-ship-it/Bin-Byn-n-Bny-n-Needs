#!/usr/bin/env bash
set -e
echo "=== BYN SYSTEM BOOT ==="
PROJECT_DIR="$(pwd)/byn_project"
required_dirs=("bin" "lib" "ext" "config")
for d in "${required_dirs[@]}"; do
    [ -d "$PROJECT_DIR/$d" ] || mkdir -p "$PROJECT_DIR/$d"
done
[ -f "$PROJECT_DIR/requirements.txt" ] && pip install -r "$PROJECT_DIR/requirements.txt"
chmod +x "$PROJECT_DIR/bin/run" 2>/dev/null || true
python3 "$PROJECT_DIR/bin/run" 2>/dev/null || true
ZIP_PATH="$PROJECT_DIR/byn_device_build.zip"
cd "$PROJECT_DIR"; zip -r "$ZIP_PATH" . >/dev/null; cd -
