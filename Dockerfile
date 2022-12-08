# Building a demo Web server to run in Docker
FROM nginx:1.10.1-alpine

# moving all the files into nginx to serve
COPY src/ /usr/share/nginx/html

# Exposing any ports
EXPOSE 80

# any commands to run on start up
CMD ["nginx", "-g", "daemon off;"]