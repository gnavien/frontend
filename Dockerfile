FROM    nginx
RUN     rm -rf /usr/share/nginx/html/* # Wanted to delete all the files in the directory location
COPY    ./  /usr/share/nginx/html

# Copy all the files in the directory location
