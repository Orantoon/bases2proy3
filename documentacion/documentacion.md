### **Base de Datos II (IC4302)** – Semestre 1, 2023
### **Proyecto #3** 
### Jennifer Alvarado Brenes – 2020124171
### Luis Diego Delgado Muñoz – 2020030408
### David Suárez Acosta – 2020038304

## **Guía de instalación y uso del proyecto**

Es necesario tener Docker Desktop instalado en el equipo, y Kubernetes habilitado en Docker Dektop. También se debe tener Helm instalado, y un entorno de línea de comandos, como la Termional o PowerShell.

Para verificar que efectivamente sí se pueda acceder a Kubernetes, esto se puede revisar ejecutando el comando "kubectl version", el cual debería mostrar la información de la versión de Kubernetes instalada.

Para cada uno de los motores de bases de datos mencionados (MariaDB, PostgreSQL, Elasticsearch, MongoDB, Neo4J, CouchDB), instala los Helm Charts correspondientes utilizando el comando helm install y proporcionando los valores de configuración adecuados. Por ejemplo, para instalar MariaDB, se puede ejecutar el comando:

"helm install mariadb ./charts/mariadb --set database rootPassword=<ROOT_PASSWORD>"

Donde <ROOT_PASSWORD> es la contraseña raíz que deseas configurar para MariaDB. Repite este paso para los demás motores de bases de datos, ajustando los comandos y valores según corresponda.

Para la instalación de las bases de datos, también se puede utilizar el archivo "instalacion.sh", como se comenta más adelante en este documento.

También es necesario configurar los Helm Charts de los backups. Para esto accede al directorio helm/backups en el proyecto. Edita el archivo values.yaml para especificar las configuraciones necesarias para crear/restaurar los backups de cada base de datos. 

Proporciona los valores de configuración para namespace, connectionString, storageAccount, container, path, maxBackups, azureSecret, name, schedule, diskSize, storageClass, provider y type según tus necesidades. Asegúrate de configurar los valores correspondientes a cada motor de base de datos. Puede ajustar otras configuraciones como el nombre del Chart, recursos de Kubernetes, etc., según se necesite.

Posteriormente, se debe instalar el Helm Chart para backups. Desde el director helm/backups, ejecute el siguiente comando para instalar el Chart de backups:

"helm install backups ."

Esto creará los recursos de Kubernetes necesarios para realizar los backups y restauraciones.

Por último, es importante verificar que los pods, servicios y otros recursos de Kubernetes se hayan creado correctamente ejecutando comandos como "kubectl get pods", "kubectl get services", etc.

Como instrucciones adicionales, utilice herramientas como telnet, curl o Postman para interactuar con las bases de datos que exponen una API y verifique que estén funcionando correctamente.

Configure los CronJobs o Jobs de Kubernetes según lo especificado en el Helm Chart de backups para que se ejecuten automáticamente y realicen los backups según el cronograma establecido.

Puede monitorear los backups realizados y verificar que se almacenen correctamente en Azure, y opcionalmente, implementar la funcionalidad de retener un número configurable de copias de seguridad más recientes.

Para restaurar un backup, modifica la configuración del Helm Chart de backups con la información del backup específico que deseas restaurar y ejecuta el comando "helm upgrade" para aplicar los cambios.
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

Create custom images | Elastic Cloud on Kubernetes [2.8] | Elastic. (n.d.). Elastic. https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-custom-images.html 

Official Elastic Community. (2021, June 24). Snapshot & Restore - Daily Elastic Byte S02E14 [Video]. YouTube. https://www.youtube.com/watch?v=hc6V-1aR33E 

Register a snapshot repository | Elasticsearch Guide [8.8] | Elastic. (n.d.). Elastic. https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-register-repository.html 

Singh, A. K. (2021, December 15). Snapshot using Azure Repository Plugin in Elasticsearch(ECK) ! Medium. https://arunksingh16.medium.com/snapshot-using-azure-repository-plugin-in-elasticsearch-eck-81584b48836a