#!/bin/bash
LOG_DIR="/var/log"
OUTPUT="log_report_$(date +%Y-%m-%d_%H-%M-%S).txt"
KEYWORDS=("error" "warning" "failed" "critical")
echo "Log Analysis Report" > "$OUTPUT"
echo "-----------------------------" >> "$OUTPUT"
for file in $LOG_DIR/*.log; do
    echo "Checking: $file" >> "$OUTPUT"
    for k in "${KEYWORDS[@]}"; do
        matches=$(grep -i "$k" "$file" 2>/dev/null)
        if [ ! -z "$matches" ]; then
            echo "--- $k found in $file ---" >> "$OUTPUT"
            echo "$matches" >> "$OUTPUT"
        fi
    done
done
echo "Report saved to $OUTPUT"
