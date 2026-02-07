# Homebrew Tap Setup Instructions

## Prerequisites

1. ✅ PR #103 merged to main
2. ✅ Release v1.1.1 created with tag
3. ✅ GitHub Actions completed and published release assets

## Setup Steps

### 1. Create Homebrew Tap Repository

Create a new GitHub repository named `homebrew-look-ma-no-hands`:

```bash
# Create the repository on GitHub (via web UI or gh CLI)
gh repo create homebrew-look-ma-no-hands --public --description "Homebrew tap for Look Ma No Hands"

# Or use the GitHub web interface:
# https://github.com/new
# Repository name: homebrew-look-ma-no-hands
# Description: Homebrew tap for Look Ma No Hands
# Public repository
```

### 2. Initialize and Push Tap Contents

```bash
cd homebrew-tap
git init
git add .
git commit -m "Initial Homebrew tap for Look Ma No Hands"
git branch -M main
git remote add origin https://github.com/qaid/homebrew-look-ma-no-hands.git
git push -u origin main
```

### 3. Update SHA256 Checksum

After the v1.1.1 release is published, download the ZIP and calculate its SHA256:

```bash
# Download the ZIP from the release
curl -L -o LookMaNoHands-1.1.1.zip \
  "https://github.com/qaid/look-ma-no-hands/releases/download/v1.1.1/LookMaNoHands-1.1.1.zip"

# Calculate SHA256
shasum -a 256 LookMaNoHands-1.1.1.zip

# Update the sha256 value in Casks/look-ma-no-hands.rb
# Replace "REPLACE_WITH_ACTUAL_SHA256" with the output
```

Or let Homebrew calculate it automatically:

```bash
brew create --cask --set-name look-ma-no-hands \
  "https://github.com/qaid/look-ma-no-hands/releases/download/v1.1.1/LookMaNoHands-1.1.1.zip"
```

### 4. Test the Cask Locally

```bash
# Audit the cask
brew audit --cask --online Casks/look-ma-no-hands.rb

# Test installation locally
brew install --cask Casks/look-ma-no-hands.rb

# Verify it works
open -a "Look Ma No Hands"

# Uninstall to test uninstall process
brew uninstall --cask look-ma-no-hands
```

### 5. Push Updated Cask

```bash
git add Casks/look-ma-no-hands.rb
git commit -m "Add SHA256 checksum for v1.1.1"
git push
```

## Testing the Tap

Once pushed, anyone can install via:

```bash
brew tap qaid/look-ma-no-hands
brew install --cask look-ma-no-hands
```

Or directly:

```bash
brew install --cask qaid/look-ma-no-hands/look-ma-no-hands
```

## Updating for Future Releases

When releasing new versions:

1. Update the `version` in `Casks/look-ma-no-hands.rb`
2. Update the `sha256` with the new release's checksum
3. Commit and push:
   ```bash
   git add Casks/look-ma-no-hands.rb
   git commit -m "Update to v1.1.2"
   git push
   ```

The `livecheck` block will help users discover new versions automatically.

## Optional: Submit to Official Homebrew Cask

For wider distribution, you can submit to the official `homebrew/cask` repository:

1. Fork https://github.com/Homebrew/homebrew-cask
2. Copy your cask to `Casks/l/look-ma-no-hands.rb`
3. Test thoroughly with `brew audit`
4. Submit a PR

Official submission criteria: https://github.com/Homebrew/homebrew-cask/blob/master/CONTRIBUTING.md
