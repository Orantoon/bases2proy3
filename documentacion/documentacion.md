### **Base de Datos II (IC4302)** – Semestre 1, 2023
### **Proyecto #3** 
### Jennifer Alvarado Brenes – 2020124171
### Luis Diego Delgado Muñoz – 2020030408
### David Suárez Acosta – 2020038304

## **Guía de instalación y uso del proyecto**

### Tecnologías Implementadas

- Docker
- MariaDB
- PostgreSQL
- Elasticsearch
- MongoDB
- Neo4J
- CouchDB
- Azure
 
Lo primero que se debe hacer es correr el archivo llamado *instalacion. sh* en la carpeta "bash" para empezar a crear los realeases de Docker de manera automatizada. En este archivo lo que se hace es correr los helm charts de las carpetas "bootstrap", "databases" y "backups". 

Con esto ya se instalan las bases de datos para todas estas tecnologías. Además, en la carpeta "backups" se encuentra un archivo llamado *values.yaml*, en el que se definen configuraciones de los backups que se realizan de las bases de datos. El nombre del Blob en Azure donde se guardan los backups dentro del Azure Storage Account es "bckup". 

## **Pruebas y sus pasos para reproducirlas**

## **Resultados de las pruebas unitarias**

## **Recomendaciones**

1. Para instalar todo lo necesario y poder hacer las pruebas, es preferible usar una consola de Visual Studio Code.
2. Se recomienda tener una guía que recopile cada comando a ser utilizado, para qué funciona y el orden en el que se deben ejecutar.
3. Se recomienda asegurarse de que al menos un integrante del grupo tenga crédito disponible en la suscripción de Azure, ya que de lo contrario, se dificultará hacer las pruebas del proyecto.
4. Es necesario que al menos un integrante del grupo de trabajo tenga un equipo que permita la utilización de Docker.
5. Es recomendable asegurarse de que todos los miembros tienen instalados los componentes necesarios para trabajar en el proyecto.
6. Es recomendable almacenar en algún lugar toda la información necesaria sobre las bases de datos, url de clústers en Elasticsearch, path de Azure Blob Storage, etc.
7. Se recomienda utilizar Docker Desktop para instalar Kubernetes en Windows.
8. Para las bases de datos que exponen un API, es recomendable utilizar Postman para interactuar con ellas.
9. Se recomienda tener clientes de administración de las bases de datos para poder realizar consultas y observar su comportamiento.
10. Se recomienda catalogar todos los archivos y scripts necesarios para el proyecto de forma ordenada en la carpeta del mismo.

## **Conclusiones**

1. El trabajo requirió de la integración de diferentes herramientas con distintos fines, lo cuál es muy importante para el aprendizaje de los desarrolladores.
2. La división de trabajo es muy importante para poder acabar el trabajo en un tiempo establecido.
3. Los conocimientos adquiridos anteriormente en otras asignaciones han sido de suma importancia para ahorrar tiempo de trabajo y aprendizaje.
4.  Asimismo, la comunicacion entre las partes del proyecto es fundamental para lograr el objetivo que se tiene para el proyecto, pues algunos elementos eran necesarios para lograr los cometidos en cada parte interesada del software que se quiere realizar.
5.  Los backups son herramientas de gran utilidad y son necesarios en cualquier sistema que utilice una abse de datos.
6.  Poder hacer restore de backups es de suma importancia para el manejo de fallos en los sistemas de bases de datos.
7.  Es importante conocer cómo es el procedimiento para cada base de datos.
8.  Se debe investigar bien sobre herramientas que muchos sistemas ya traen integradas, como el caso de los Snapshots en Elasticsearch.
9.  Se debe tener muy claro el proceso de la creación y restauración de backups en sí, ya que este mismo proceso es el que se replica para las bases de datos.
10. Para poder realizar el proyecto es indispensable que al menos un miembro del grupo tenga un equipo que pueda utilizar Docker sin problemas.

## **Referencias bibliográficas**