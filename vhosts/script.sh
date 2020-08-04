domain="demo11"
echo '<VirtualHost *:80>
    DocumentRoot "/var/www/html/'$domain'/"
    ServerName '$domain'.saas-demo.imprintnext.io
    <Directory "/var/www/html/$domain/">
        Options Indexes FollowSymLinks Includes ExecCGI
        DirectoryIndex index.php index.html
        AllowOverride All
        Order deny,allow
        deny from all
        Allow from all
        Require all granted
    </Directory>
</VirtualHost>' >>  000-default.conf
 echo '127.0.0.1 '$domain'.saas-demo.imprintnext.io' >>/etc/hosts

sudo mkdir ../public_html/$domain
echo 'Welcome i am from domain11'>>../public_html/$domain/index.html;
sudo docker exec -it php72 service apache2 reload
sudo docker exec -it ubuntu_mysql_1 mysql -uroot -prootpassword -e "Create Database $domain"
