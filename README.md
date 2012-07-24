inginx.conf
==============

Easy to manage multiple php servers behind Nginx.

***NOTICE:Before you start, backup your `nginx/conf` directory first.***

Deploy
-----------

### Automatic way

***NOTICE:This shell script based on `wget` and `unzip`.***

You can simply download [deploy.sh](https://raw.github.com/shenjia/inginx.conf/master/deploy.sh) on your server and run it. The `deploy.sh` could find your `nginx/conf` directory and deploy automatically, after your confirmed.

```bash
./deploy.sh
```

You can also define the deploy directory by yourself:

```bash
./deploy.sh /etc/nginx/conf
```

### Manual way

You can download this project, and copy `conf` to your `nginx/conf` directory.

```bash
cp conf /usr/local/nginx/conf
```

### Manual way


Quick start
-----------

### 1. Create a server config file.

Create a server config file by simply make a copy from the example file.

```bash
cd /usr/local/nginx/conf/servers
cp server.example myserver.conf
```

Edit `myserver.conf` and setup **server_name** and **root**.


### 2. Restart your nginx service.


TODO
---------------

1. add more settings 
2. add comments
3. support other languages