# Homebrew Tap for gmfind

Homebrew formula for [gmfind](https://github.com/automoto/gmfind) - a Steam automation CLI for finding games, checking deals, and purchasing.

## Installation

```bash
brew tap automoto/gmfind
brew install gmfind
```

## Post-Install (Optional)

For browser automation commands (buy, balance, inventory --private):

```bash
$(brew --prefix gmfind)/libexec/bin/python -m pip install playwright
# Install the browsers (using the same environment)
$(brew --prefix gmfind)/libexec/bin/python -m playwright install chromium
```

## Usage

```bash
# Find discounted games matching your preferences
gmfind deals 5

# Check game details (price, ratings, compatibility)
gmfind check 1145350

# Look up a game's Steam App ID
gmfind id "Hades"

# See all commands
gmfind --help
```

## Command Reference

### API Commands (work immediately)
| Command | Description |
|---------|-------------|
| `gmfind check <APP_ID>` | Get game details |
| `gmfind deals [N]` | Find N discounted games |
| `gmfind id "<TITLE>"` | Look up Steam App ID |
| `gmfind blocklist "<TITLE>"` | Check blocklist |
| `gmfind inventory --public` | Export game library |

### Browser Commands (require Playwright)
| Command | Description |
|---------|-------------|
| `gmfind buy <APP_ID>` | Purchase a game |
| `gmfind balance` | Check Steam Wallet balance |
| `gmfind inventory --private` | Export library (private profiles) |

## Links

- [gmfind on GitHub](https://github.com/automoto/gmfind)
- [gmfind on PyPI](https://pypi.org/project/gmfind/)
