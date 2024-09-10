# #!/usr/bin/env bash

# Output in GiB
memory_usage="$(free -h | awk '/Mem:/ {print $3}')"
echo "$memory_usage"

# Output in %
# memory_usage=$(free | awk '/Mem/{printf("%.0f", $3/$2 * 100)}')
# echo "$memory_usage"
