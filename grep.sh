#!bin/bash
FL='num.txt'
echo "$FL file:"
cat $FL
echo "> grep '^ ' $FL"
grep '^ ' $FL
echo "> grep '15' $FL"
grep '15' $FL
echo "> grep -i 'OnE' $FL"
grep -i 'OnE' $FL
echo "> grep -c '1' $FL"
grep -c '1' $FL
echo "> grep -v '^ ' $FL"
grep -v '^ ' $FL
echo "> grep -n '3' $FL"
grep -n '3' $FL
echo "> grep -l '9' *txt"
grep -l '9' *.txt
