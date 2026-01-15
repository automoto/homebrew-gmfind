# Homebrew Tap Maintenance

## Updating for New Releases

When releasing a new version of gmfind:

### 1. Get the new SHA256
```bash
curl -sL https://pypi.org/pypi/gmfind/json | jq -r '.urls[] | select(.packagetype=="sdist") | .digests.sha256'
```

### 2. Get the new URL
```bash
curl -sL https://pypi.org/pypi/gmfind/json | jq -r '.urls[] | select(.packagetype=="sdist") | .url'
```

### 3. Update Formula/gmfind.rb
- Update the `url` with the new package URL
- Update the `sha256` with the new hash

### 4. Regenerate resources (if dependencies changed)
Use Homebrew's built-in command:
```bash
brew update-python-resources Formula/gmfind.rb
```

Then remove the playwright resource block (since it's optional and has no sdist).

### 5. Test locally
```bash
brew install --build-from-source ./Formula/gmfind.rb
gmfind --version
gmfind deals 2
```

### 6. Commit and push
```bash
git add Formula/gmfind.rb
git commit -m "Update gmfind to version X.Y.Z"
git push
```

## Testing Installation

```bash
# Fresh install
brew tap automoto/gmfind
brew install gmfind

# Upgrade
brew upgrade gmfind

# Verify
gmfind --version
gmfind deals 2
```

## Notes

- Playwright is NOT included in the formula (it's optional)
- Users who need browser commands should install playwright separately
- The formula uses Python 3.12 from Homebrew
