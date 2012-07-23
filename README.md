inginx.conf
==============

Easy to manage multiple php servers behind Nginx.

***NOTICE:Before you start, backup your `nginx/conf` directory first.***

Quick start
-----------


### 1. Deploy inginx.conf on your server

You can simply download `deploy.sh` and  
Copy `conf` to your `nginx/conf` directory.

```bash
cp conf /usr/local/nginx/conf
```

### 2. Create a server config file.

Create a server config file by simply make a copy from the example file.

```bash
cd /usr/local/nginx/conf/servers
cp server.example myserver.conf
```

Edit `myserver.conf` and setup **server_name** and **root**.


### 3. Restart your nginx service.


TODO
---------------

1. add more settings 
2. add comments
3. support other languages