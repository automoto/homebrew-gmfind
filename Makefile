latest:
	curl -s https://pypi.org/pypi/gmfind/json | jq -r '.urls[] | select(.packagetype == "sdist") | .url' | head -n 1
