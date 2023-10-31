#!/usr/bin/env bash

count=$#

if [ "$count" -gt 0 ]; then
	for file in "$@"; do
		touch "$file"; chmod u+x "$file"; echo '#!/usr/bin/env ruby' > "$file"
	done
fi
