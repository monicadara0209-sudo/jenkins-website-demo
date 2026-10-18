FROM nginx:alpine
COPY build/index.html /usr/share/nginx/html/index.html
EXPOSE 80
