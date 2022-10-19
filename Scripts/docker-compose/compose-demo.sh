#!/bin/bash
mkdir -p ~/Docker/compose-demo/app && cd ~/Docker/compose-demo && cat > app/index.html << EOF
#Create a static index.html page to be used as a rood document page with a linked CSS formating
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Docker Compose Demo</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>

    <h1>This is a Docker Compose Demo Page.</h1>
    <p>This content is being served by an Nginx container.</p>

</body>
</html>

EOF

cat > docker-compose.yml << EOF
#Create docker-compose.yml file
version: '3.7'
services:
  web:
    image: nginx:alpine
    ports:
      - "8000:80"
    volumes:
      - ./app:/usr/share/nginx/html

EOF
