# bd-tp1
bd-tp1 1c 2017

### Instalación MySQL

** https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-16-04

### INFORME

** https://docs.google.com/document/d/1WUDnNB1djPS3ea6m_FGljwXjzV1cjkaxWwSXkOtOVaw/edit?usp=sharing

### DER 

** https://drive.google.com/file/d/0BzkIgbt1E5IqbTVYSzBnVTVXYjQ/view?usp=sharing

### Restricciones

** https://docs.google.com/document/d/1mxNmnHbKvaNbIm4-fF0P2KTh5x7LIK_cTWKnDsJcBQo/edit?usp=sharing

### Generar dump de la base

    mysqldump -uroot -p Mundial2017 > Mundial2017.sql

### Cargar base a patir del dump

    mysqladmin -uroot -p create Mundial2017
    mysql -uroot -p Mundial2017 < Mundial2017.sql
