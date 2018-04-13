--- 
customlog: 
  - 
    format: combined
    target: /etc/apache2/logs/domlogs/wikiceleb.com
  - 
    format: "\"%{%s}t %I .\\n%{%s}t %O .\""
    target: /etc/apache2/logs/domlogs/wikiceleb.com-bytes_log
documentroot: /home/wikicele/public_html
group: wikicele
hascgi: 1
homedir: /home/wikicele
ip: 198.252.107.62
owner: root
phpopenbasedirprotect: 1
port: 80
scriptalias: 
  - 
    path: /home/wikicele/public_html/cgi-bin
    url: /cgi-bin/
serveradmin: webmaster@wikiceleb.com
serveralias: www.wikiceleb.com mail.wikiceleb.com
servername: wikiceleb.com
ssl: 1
usecanonicalname: 'Off'
user: wikicele
userdirprotect: ''
