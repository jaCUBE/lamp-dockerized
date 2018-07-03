# LAMP Dockerized
Basic LAMP server based on Debian for my usage. :)

The goal is to be able to run on any OS with recent version of software.

This Docker images are intended for development software purpose as they include developer and diagnostic tools.





## Docker
Start Docker containers like this:
```
docker-compose up
```

Docker image builds automatically the first time. If you want to rebuild it later this:
```
docker-compose build
```




## PHP
(TODO)




## MariaDB/MySQL
(TODO)

### Example
An example how to connect MariaDB/MySQL running inside Docker container through its name.
```php
$myPDO = new PDO('mysql:host=app-mariadb;dbname=test', 'root', '12345');
```





## Redis
(TODO)





### Example
An example how to connect Redis running inside Docker container through its name.

```php
$redis = new Redis();
$redis->connect('app-redis', 6379);
```

Read more about using [at **phpredis** GitHub page](https://github.com/phpredis/phpredis).





## ElasticSearch
You can check ElasticSearch health on this URL:
```
http://127.0.0.1:9200/_cat/health
```




## OS
(TODO)