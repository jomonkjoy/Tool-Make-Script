# $1 source pattern $2 dest pattern $3 file list
grep -rl ''$1'' $3 | xargs sed -i 's|'$1'|'$2'|g';
