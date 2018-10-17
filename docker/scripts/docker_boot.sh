service apache2 start

# Apache all sites-available enabling
cd /etc/apache2/sites-available/
a2dissite *
a2ensite *
service apache2 reload