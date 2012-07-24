inginx.conf
==============

Easy to manage multiple php servers behind Nginx.

***NOTICE: Before you start, please backup your `nginx/conf` directory.***

Deploy
-----------

### Automatic way

You can simply download [deploy.sh](https://raw.github.com/shenjia/inginx.conf/master/deploy.sh) on your server and run it. The `deploy.sh` could find your `nginx/conf` directory and deploy automatically, after your confirmed.

***NOTICE: The `deploy.sh` based on `wget` and `unzip`.***

```bash
./deploy.sh
```

You can also define the deploy directory by yourself:

```bash
./deploy.sh /etc/nginx/conf
```

### Manual way

You can [download this project](https://github.com/shenjia/inginx.conf/zipball/master), extract it by `unzip`, then copy `conf` to your `nginx/conf` directory.

```bash
cp conf /usr/local/nginx/conf
```

Quick start
-----------

### 1. Create a new server.

You can create a new server by simply make a copy from the example file.

```bash
cd /usr/local/nginx/conf/servers
cp server.conf.example myserver.conf
```

Edit `myserver.conf` and setup **server_name** and **root**.


### 2. Restart your nginx service.


TODO
---------------

1. add more settings 
2. add comments
3. support other languages