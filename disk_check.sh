
#!/bin/bash

THRESHOLD=80

echo "Checking disk usage (threshold: ${THRESHOLD}%)"

df -h --output=source,pcent,target | tail -n +2 | while read -r fs usage mount; do
    percent=${usage%\%}
    if [ "$percent" -ge "$THRESHOLD" ]; then
        echo "WARNING: $mount is at ${percent}% ($fs)"
    else
        echo "OK: $mount is at ${percent}%"
    fi
done
