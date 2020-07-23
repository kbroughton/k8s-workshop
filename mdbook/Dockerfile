FROM nginx:alpine

# Copy a configuration file from the current directory
COPY nginx.conf /etc/nginx/

COPY book /usr/share/nginx/html/
COPY book /var/www/html/

# Expose ports
EXPOSE 80

