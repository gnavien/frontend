FROM    nginx
RUN     rm -rf /usr/share/nginx/html/* # Wanted to delete all the files in the directory location
COPY    ./  /usr/share/nginx/html
COPY        nginx-roboshop.conf /etc/nginx/conf.d/default.conf

# Copy all the files in the directory location to default.conf
