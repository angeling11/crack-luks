# crack-luks

## Info
The Linux Unified Key Setup (LUKS) is a disk encryption specification.
Knowing the password of the encrypted file, the disk can be decrypted with:

`cryptsetup open <cncrypted file> <output name>`

And mounted:

`mount /dev/mapper/<output name> <mountpoint>`


## Usage
`./crack_luks <encrypted disk> <wordlist>`


## Author
natryvat


## Based on
https://dfir.science/2014/08/how-to-brute-forcing-password-cracking.html
