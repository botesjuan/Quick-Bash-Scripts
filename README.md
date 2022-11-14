# List Bash Short Scripts
Sample of Bash scripts

The below bash oneliner script reads each line of text file and ping echo, and return the line with success PING and show IP address.  
```bash
while IFS= read -r line; do ping -c 1 $line; done <list-domain-controllers.txt | grep 'PING'
```

More bash scripts too follow    
