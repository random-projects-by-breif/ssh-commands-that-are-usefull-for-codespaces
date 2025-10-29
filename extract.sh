# make sure to name this file extract.sh
if [ -z "$1" ]; then
    echo "Usage: ./extract.sh <filename.zip>"
    echo "Example: ./extract.sh my_archive.zip"
    exit 1
fi
ZIP_FILE="$1"
echo "Starting file extraction process for '$ZIP_FILE'..."

if [ ! -f "$ZIP_FILE" ]; then
    echo "❌ Error: File '$ZIP_FILE' not found."
    exit 1
fi
if ! command -v unzip &> /dev/null
then
    echo "❌ Error: 'unzip' utility not found. Please install it on your system."
    exit 1
fi
TARGET_DIR="${ZIP_FILE%.*}"

if [ -d "$TARGET_DIR" ]; then
    echo "⚠️ Warning: Target directory '$TARGET_DIR' already exists."
    echo "Contents will be merged or overwritten."
else
    echo "Creating target directory: '$TARGET_DIR'"
    mkdir -p "$TARGET_DIR"
fi

echo "Extracting contents to '$TARGET_DIR/'..."
if unzip -q "$ZIP_FILE" -d "$TARGET_DIR"; then
    echo "✅ Extraction complete!"
    echo "Extracted files are located in the directory: '$TARGET_DIR/'"
else
    echo "❌ Extraction failed! Check if the file is a valid, uncorrupted zip archive."
    if [ -z "$(ls -A "$TARGET_DIR")" ]; then
       rmdir "$TARGET_DIR" 2>/dev/null
    fi
    exit 1
fi
# commands
# chmod +x extract.sh
# ./extract.sh (fle path)
