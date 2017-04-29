# bd-tp1
bd-tp1 1c 2017

### Instalación MySQL

** https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-16-04

### DER

** https://drive.google.com/file/d/0BzkIgbt1E5IqbTVYSzBnVTVXYjQ/view?usp=sharing

### Generar dump de la base

    mysqldump -uroot -p Mundial2017 > Mundial2017.sql

### Cargar base a patir del dump

    mysqladmin -uroot -p create Mundial2017
    mysql -uroot -p Mundial2017 < Mundial2017.sql
