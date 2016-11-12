Hello World,

-------------------------------------------------------------------------------------------------------------------------------------------------------
There are 2 Docker Image you will find with this repository. 1. Application Docker Image 2. MySQL Database Docker Image

Application Docker image contains Apache2 + PHP7 + PHPMyAdmin + Composer for Mangento2 Stacks which can work over Ubuntu - Linux Distribution OS.

---------------------
Application Container
---------------------
This image installs the following:
 - Apache 2.x (latest mainline version) + mod_rewrite
 - PHP 7.0.x  (latest mainline version) + Mangeto2 stack requirements
 - PHPMyAdmin 4.6.4
 - Composer (latest mainline version)
 
Environment Variables:
 - ROOTPASS : Configure/Setup ROOT user password
 - USER : Deployment/File User
 - PASSWORD : Deployment User Password

Application Docker Command :
docker run -i -t -d --link lamp-magento2-mysql:db --name lamp-magento2-application -v /var/www/html/:/var/www/html/ -e ROOTPASS:root123 -e USER:magento PASSWORD:magento@123 -p 1080:80 -p 1022:22 -p magento2-application

-------------------------------------------------------------------------------------------------------------------------------------------------------
MySQL Docker image contains MySQL Server 5.7 for Mangento2 Stacks which can work over Ubuntu - Linux Distribution OS.
------------------------
MySQL Database Container
------------------------
This image installs the following:
 - Mysql Server 5.7
 
Environment Variables:
 - MYSQL_ROOT_PASSWORD
 - MYSQL_LOCAL_PASSWORD 
 - MYSQL_LOCAL_USER
 
MySQl Database Docker Command :
docker run -i -t -d --name lamp-magento2-mysql -v /var/www/data/:/var/lib/mysql/ -e MYSQL_ROOT_PASSWORD:root123 -e MYSQL_LOCAL_USER:magento MYSQL_LOCAL_PASSWORD:magento@123 magento2-mysql

Access MySQL from Application Container
Hostname: db

MySQL Terminal Command : mysql -h db -u root -p

-------------------------------------------------------------------------------------------------------------------------------------------------------
