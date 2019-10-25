#!/bin/bash
sudo mysql -sN -e 'select distinct domainname from recondb.domains limit 20' | httprobe -c 20 | sed 's/https\?:\/\///' | xargs -n1 -I{} mysql -e 'update recondb.domains set 'alive' =1 where 'domainname'="{}"'

