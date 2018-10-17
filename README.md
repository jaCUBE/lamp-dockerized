# LAMP Dockerized
Basic LAMP server based on Debian for my usage. :)

The goal is to be able to run on any OS with recent version of software.

This Docker images are intended for development software purpose as they include developer and diagnostic tools.





## Docker
Start Docker containers like this:
```
docker-compose up
```

### Connecting a Container
```
docker exec -it app-php bash
```

### Re-Building
Docker image builds automatically the first time. If you want to rebuild it later this:
```
docker-compose build
```

or optionally re-building with no cache used:

```
docker build ./docker/images/php-7.2 -t php:test --no-cache
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
TODO





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
TODO

### Bundled Tools
**Discus:** Disk usage tool ([Discus web](http://www.debianadmin.com/check-your-linux-machine-disk-space-using-discus.html))
```
root@c8532ee00cb9:~# discus
```

**Dstat:** Overall system resources usage statistics tool ([Dstat web](http://dag.wiee.rs/home-made/dstat/), [Dstat GitHub](https://github.com/dagwieers/dstat))
```
root@c8532ee00cb9:~# dstat
```

**git-flow**
TODO

**Glances:** Overall system resources usage overview tool ([Glances GitHub](https://github.com/nicolargo/glances))
```
root@c8532ee00cb9:~# glances
```

**htop:** System processes running overview tool ([htop web](https://hisham.hm/htop/))
```
root@c8532ee00cb9:~# htop
```

**imagemagick**
TODO

**lsof:** List of open files tool ([lsof web](https://www.ibm.com/developerworks/aix/library/au-lsof.html))
```
root@c8532ee00cb9:~# lsof
```

**Midnight Commander:** GUI file commander ([MC web](https://midnight-commander.org/), [MC GitHub](https://github.com/MidnightCommander/mc))
```
root@c8532ee00cb9:~# mc
```

**My Traceroute (MTR):** Traceroute and ping tool ([MTR web](https://www.linode.com/docs/networking/diagnostics/diagnosing-network-issues-with-mtr/))
```
root@c8532ee00cb9:~# mtr nix.cz
```

**nano:** Popular text editor ([nano wiki](https://en.wikipedia.org/wiki/GNU_nano))
```
root@c8532ee00cb9:~# nano test.txt
```

**neofetch** Nice overview of system ([neofetch GitHub](https://github.com/dylanaraps/neofetch))
```
neofetch
```

**Nmap:** Tool for mapping network ([Nmap web](https://www.linux.com/learn/beginners-guide-nmap))
```
root@c8532ee00cb9:~# nmap host.docker.internal
```

**tcpdump:** Packet sniffer for TCP/IP ([tcpdump web](https://www.tecmint.com/12-tcpdump-commands-a-network-sniffer-tool/))
```
root@c8532ee00cb9:~# tcpdump
```

**vim:** Popular text editor ([vim web](https://www.vim.org/))
```
root@c8532ee00cb9:~# vim test.txt
```



![LAMP Dockerized Neofetch](https://i.imgur.com/vu4AJu2.png "LAMP Dockerized Neofetch")