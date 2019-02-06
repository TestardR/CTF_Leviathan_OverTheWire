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