#!/bin/bash
mkdir ~/Docker/hello-world && cd ~/Docker/hello-world && cat > docker-compose.yml << EOF
version: '2'
services:
   hello-world:
      image:
         hello-world:latest

EOF
