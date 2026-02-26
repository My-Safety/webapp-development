# Serve pre-built Flutter web app with nginx
FROM nginx:alpine

# Copy pre-built web files
COPY build/web /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
