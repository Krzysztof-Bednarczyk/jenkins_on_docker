#!/bin/bash
docker exec -it jenkins bash  
&& ssh-keyscan -H agent >> .ssh/known_hosts  