#!/bin/bash
set -e

VERSION="${1:-1.1.1}"
CASK_FILE="Casks/look-ma-no-hands.rb"
ZIP_URL="https://github.com/qaid/look-ma-no-hands/releases/download/v${VERSION}/LookMaNoHands-${VERSION}.zip"

echo "Downloading LookMaNoHands-${VERSION}.zip..."
curl -L -o "/tmp/LookMaNoHands-${VERSION}.zip" "$ZIP_URL"

echo "Calculating SHA256..."
SHA256=$(shasum -a 256 "/tmp/LookMaNoHands-${VERSION}.zip" | awk '{print $1}')

echo "SHA256: $SHA256"

echo "Updating $CASK_FILE..."
sed -i '' "s/REPLACE_WITH_ACTUAL_SHA256/$SHA256/" "$CASK_FILE"
sed -i '' "s/version \".*\"/version \"$VERSION\"/" "$CASK_FILE"

echo "Cleaning up..."
rm "/tmp/LookMaNoHands-${VERSION}.zip"

echo ""
echo "✅ Updated $CASK_FILE with:"
echo "   Version: $VERSION"
echo "   SHA256: $SHA256"
echo ""
echo "Review the changes and commit:"
echo "   git diff $CASK_FILE"
echo "   git add $CASK_FILE"
echo "   git commit -m 'Update to v$VERSION with SHA256'"
echo "   git push"
