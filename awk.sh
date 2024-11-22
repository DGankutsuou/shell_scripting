#!bin/bash
cat filex.txt
echo ""
echo "> awk -F: '{printf("%s - %s - %s\n", \$3, \$2, \$1)}'" filex.txt
awk -F: '{printf("%s - %s - %s\n", $3, $2, $1)}' filex.txt
