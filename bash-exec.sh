echo 1

#exec 3>&1 4>&2
exec 1>stdout 2>stderr

echo 2

exec 1>&3 2>&4
exec 3>&- 4>&-

echo 3

cat stdout
cat stderr
rm stdout stderr
