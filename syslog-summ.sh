grep -E '(warning|error|critical)' syslog.txt | awk '{print $1 " " $2 " " $3 " " $6}' | sort | uniq -c > summary.txt
