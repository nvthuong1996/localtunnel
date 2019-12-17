# Serveo server containerization
## Tunnel local port to internet use serveo
### run docker file with DOMAIN env is your domain
### example in local: 
`ssh -o ServerAliveInterval=10 -o ServerAliveCountMax=10  -R c:80:localhost:5000 localtunnel.local -p 2222`

test: subdomain

localtunnel.local: your subdomain

more info
http://serveo.net/
