This repository contains everything needed to create and renew LetsEncrypt certificates (incl. wildcard certificates) on Dynu (https://www.dynu.com/).
This should work on every machine that can run docker (I'm using it on a QNAP NAS).
If you already have certbot installed you can also just use the scripts in the scripts folder, without docker.

# Usage with docker-compose:
You will need Docker and Docker-Compose:

https://docs.docker.com/install/
https://docs.docker.com/compose/install/

docker-compose -f <PATH_TO_FILES>/certbot/docker-compose.yml up

Cronjob to run it twice daily (like recomended by Certbot, certificates are only renewed when needed):

0 0,12 * * * python -c 'import random; import time; time.sleep(random.random() * 3600)' && docker-compose -f <PATH_TO_FILES>/certbot/docker-compose.yml up

# Usage with locally installed certbot:
Required packages: certbot, jq, curl

certbot certonly --manual-public-ip-logging-ok --non-interactive --agree-tos --email <PUT_YOUR_EMAIL_HERE> --manual --preferred-challenges=dns --manual-auth-hook <PATH_TO_FILES>/script-pre.sh --manual-cleanup-hook <PATH_TO_FILES>/script-post.sh -d YOURDOMAIN.TLD -d *.YOURDOMAIN.TLD
