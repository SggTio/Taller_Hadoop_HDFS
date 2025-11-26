# Taller Hadoop HDFS

Este repositorio contiene la solución del taller de **Hadoop HDFS**:

- Scripts Bash modulares para verificar configuración, interactuar con HDFS y documentar las operaciones administrativas.
- Un `Makefile` que centraliza las tareas típicas del taller.
- Los documentos del enunciado y del informe en `doc/`.

> **Importante (entorno del curso):**  
> En el clúster de laboratorio, los demonios de HDFS (`NameNode`, `DataNode`, `SecondaryNameNode`) **solo pueden ser ejecutados por el usuario administrador `usuario`**.  
> La cuenta de estudiante (`estudiante`) se utiliza únicamente como **cliente HDFS**.  
> Por eso, los scripts `init_namenode.sh`, `start_hdfs.sh` y `stop_hdfs.sh` están implementados como *wrappers/documentación* que **no** arrancan ni detienen servicios en este entorno, sino que explican el procedimiento real y verifican el estado cuando es posible.

---

## 1. Estructura del repositorio

```text
Taller_Hadoop_HDFS/
├── Makefile
├── README.md
├── .gitignore
├── config/
│   ├── core-site.xml
│   ├── hadoop-env.sh
│   ├── hdfs-site.xml
│   └── workers
├── scripts/
│   ├── config.sh
│   ├── check_env.sh
│   ├── init_namenode.sh
│   ├── start_hdfs.sh
│   ├── stop_hdfs.sh
│   ├── hdfs_demo.sh
│   └── clean_hdfs.sh
└── doc/
    ├── Taller_Hadoop_HDFS.pdf
    └── Taller_Hadoop_HDFS-1.pdf
# Taller Hadoop HDFS

Este repositorio contiene la solución del taller de **Hadoop HDFS**:

- Scripts Bash modulares para verificar configuración, interactuar con HDFS y documentar las operaciones administrativas.
- Un `Makefile` que centraliza las tareas típicas del taller.
- Los documentos del enunciado y del informe en `doc/`.

> **Importante (entorno del curso):**  
> En el clúster de laboratorio, los demonios de HDFS (`NameNode`, `DataNode`, `SecondaryNameNode`) **solo pueden ser ejecutados por el usuario administrador `usuario`**.  
> La cuenta de estudiante (`estudiante`) se utiliza únicamente como **cliente HDFS**.  
> Por eso, los scripts `init_namenode.sh`, `start_hdfs.sh` y `stop_hdfs.sh` están implementados como *wrappers/documentación* que **no** arrancan ni detienen servicios en este entorno, sino que explican el procedimiento real y verifican el estado cuando es posible.

---

## 1. Estructura del repositorio

```text
Taller_Hadoop_HDFS/
├── Makefile
├── README.md
├── .gitignore
├── config/
│   ├── core-site.xml
│   ├── hadoop-env.sh
│   ├── hdfs-site.xml
│   └── workers
├── scripts/
│   ├── config.sh
│   ├── check_env.sh
│   ├── init_namenode.sh
│   ├── start_hdfs.sh
│   ├── stop_hdfs.sh
│   ├── hdfs_demo.sh
│   └── clean_hdfs.sh
└── doc/
    ├── Taller_Hadoop_HDFS.pdf
    └── Taller_Hadoop_HDFS-1.pdf
# Taller Hadoop HDFS

Este repositorio contiene la solución del taller de **Hadoop HDFS**:

- Scripts Bash modulares para verificar configuración, interactuar con HDFS y documentar las operaciones administrativas.
- Un `Makefile` que centraliza las tareas típicas del taller.
- Los documentos del enunciado y del informe en `doc/`.

> **Importante (entorno del curso):**  
> En el clúster de laboratorio, los demonios de HDFS (`NameNode`, `DataNode`, `SecondaryNameNode`) **solo pueden ser ejecutados por el usuario administrador `usuario`**.  
> La cuenta de estudiante (`estudiante`) se utiliza únicamente como **cliente HDFS**.  
> Por eso, los scripts `init_namenode.sh`, `start_hdfs.sh` y `stop_hdfs.sh` están implementados como *wrappers/documentación* que **no** arrancan ni detienen servicios en este entorno, sino que explican el procedimiento real y verifican el estado cuando es posible.

---

## 1. Estructura del repositorio

```text
Taller_Hadoop_HDFS/
├── Makefile
├── README.md
├── .gitignore
├── config/
│   ├── core-site.xml
│   ├── hadoop-env.sh
│   ├── hdfs-site.xml
│   └── workers
├── scripts/
│   ├── config.sh
│   ├── check_env.sh
│   ├── init_namenode.sh
│   ├── start_hdfs.sh
│   ├── stop_hdfs.sh
│   ├── hdfs_demo.sh
│   └── clean_hdfs.sh
└── doc/
    ├── Taller_Hadoop_HDFS.pdf
    └── Taller_Hadoop_HDFS-1.pdf

# Taller Hadoop HDFS

Este repositorio contiene la solución del taller de **Hadoop HDFS**:

- Scripts Bash modulares para verificar configuración, interactuar con HDFS y documentar las operaciones administrativas.
- Un `Makefile` que centraliza las tareas típicas del taller.
- Los documentos del enunciado y del informe en `doc/`.

> **Importante (entorno del curso):**  
> En el clúster de laboratorio, los demonios de HDFS (`NameNode`, `DataNode`, `SecondaryNameNode`) **solo pueden ser ejecutados por el usuario administrador `usuario`**.  
> La cuenta de estudiante (`estudiante`) se utiliza únicamente como **cliente HDFS**.  
> Por eso, los scripts `init_namenode.sh`, `start_hdfs.sh` y `stop_hdfs.sh` están implementados como *wrappers/documentación* que **no** arrancan ni detienen servicios en este entorno, sino que explican el procedimiento real y verifican el estado cuando es posible.

---

## 1. Estructura del repositorio

```text
Taller_Hadoop_HDFS/
├── Makefile
├── README.md
├── .gitignore
├── config/
│   ├── core-site.xml
│   ├── hadoop-env.sh
│   ├── hdfs-site.xml
│   └── workers
├── scripts/
│   ├── config.sh
│   ├── check_env.sh
│   ├── init_namenode.sh
│   ├── start_hdfs.sh
│   ├── stop_hdfs.sh
│   ├── hdfs_demo.sh
│   └── clean_hdfs.sh
└── doc/
    ├── Taller_Hadoop_HDFS.pdf
    └── Taller_Hadoop_HDFS-1.pdf
```

```text
config/
```

Contiene la configuración de Hadoop empleada en el taller:

core-site.xml: define, entre otros, fs.defaultFS (por ejemplo hdfs://10.43.100.121:9000).

hdfs-site.xml: parámetros de HDFS, como dfs.replication.

hadoop-env.sh: variables de entorno (incluye JAVA_HOME, etc.).

workers: lista de nodos worker del clúster.

Estos archivos reflejan la configuración proporcionada/validada en el entorno del taller.
No se modifican para cambiar permisos de ejecución; eso es responsabilidad del administrador del clúster.

```text
scripts/
```
Scripts Bash que encapsulan la lógica del taller:

config.sh
Configuración común:

Respeta JAVA_HOME, HADOOP_HOME, HADOOP_CONF_DIR si ya vienen del entorno.

Si es necesario, intenta inferir HADOOP_HOME a partir de la ubicación de hdfs.

Añade bin/ y sbin/ de Hadoop al PATH.

check_env.sh
Verifica:

Variables de entorno clave (JAVA_HOME, HADOOP_HOME, HADOOP_CONF_DIR).

Presencia de los archivos de configuración (core-site.xml, hdfs-site.xml, hadoop-env.sh, workers).

Parámetros críticos (fs.defaultFS, dfs.replication, etc.).

Lista de nodos worker.

init_namenode.sh
Módulo conceptual de inicialización del NameNode.
En un despliegue real local, este script podría ejecutar:

```bash
hdfs namenode -format
```

Sin embargo, en el clúster de laboratorio solo el usuario usuario puede formatear el NameNode.
Por ello, en este entorno el script no ejecuta el formateo real; se limita a documentar el procedimiento y salir sin error.

start_hdfs.sh
Representa el arranque del clúster HDFS:

Explica que el comando real es start-dfs.sh.

Indica que solo usuario puede ejecutar dicho comando.

No intenta arrancar los demonios; en su lugar:

Muestra los procesos Java con jps -l.

Ejecuta hdfs dfsadmin -report para comprobar si el NameNode está accesible.

Si el NameNode responde, muestra el resumen del clúster.

Si no responde, indica que probablemente el clúster no está levantado y que debe hacerlo el administrador.

stop_hdfs.sh
Representa la detención del clúster HDFS:

Explica que el comando real es stop-dfs.sh.

Indica que solo usuario puede detener los demonios.

No intenta detener servicios; simplemente muestra los procesos Java (jps -l) como referencia.

hdfs_demo.sh
Script de demostración de comandos HDFS como cliente (cuenta estudiante).
Asume que el clúster ya está levantado por usuario y ejecuta:

Creación de directorios de prueba en HDFS (ej. /pruebas_hdfs/datos, etc.).

Carga de ficheros desde el sistema local (hdfs dfs -put).

Lectura de archivos en HDFS (hdfs dfs -cat).

Descarga a local (hdfs dfs -get).

Operaciones de gestión:

Copia interna (hdfs dfs -cp).

Renombrado/movido (hdfs dfs -mv).

Estadísticas (hdfs dfs -du, hdfs dfs -dus).

Metadatos (hdfs dfs -stat).

Mensajes de log explicando cada paso.

clean_hdfs.sh
Elimina el directorio de pruebas en HDFS (por ejemplo /pruebas_hdfs) para dejar el clúster limpio al finalizar el taller.

```text
doc/
```

Taller_Hadoop_HDFS.pdf: informe/resolución del taller.

Taller_Hadoop_HDFS-1.pdf: enunciado original proporcionado en el curso.

2. Uso del Makefile

El Makefile expone las tareas principales como comandos make:
```bash
help:
	@echo "Comandos disponibles:"
	@echo "  make env    - Verificar entorno y configuración"
	@echo "  make init   - Documentar/gestionar inicialización de NameNode (no formatea en este entorno)"
	@echo "  make start  - Verificar estado del clúster HDFS"
	@echo "  make stop   - Mostrar procesos Java relativos a HDFS"
	@echo "  make status - Mostrar resumen del NameNode (dfsadmin -report)"
	@echo "  make demo   - Ejecutar comandos de demostración HDFS (requiere clúster levantado)"
	@echo "  make clean  - Limpiar datos de pruebas en HDFS"
```

Flujo típico en el entorno del taller:

1. Verificar entorno:
```text
make env
```

2. Ejecutar el módulo conceptual de inicialización:
```text
make init
```

3. Verificar estado del clúster:

```text
make start
```

Si el NameNode ya está levantado por usuario, dfsadmin -report mostrará el resumen del clúster.

Si no lo está, el script indicará que no se pudo contactar al NameNode.

4. Ejecutar la demo HDFS (solo si el clúster está levantado):

```text
make demo
```

Crea directorios de prueba en HDFS.

Sube y baja archivos.

Ejecuta operaciones básicas de lectura y gestión.

5. Limpiar datos de prueba:

```text
make clean
```

6. Verificar/consultar procesos HDFS (en modo lectura):

```text
make stop
```

Este comando no detiene demonios; solo muestra procesos Java y recuerda que stop-dfs.sh debe ser ejecutado por usuario. 

3. Entorno y requisitos

Acceso al clúster Hadoop del curso.

Java 8 disponible (definido en JAVA_HOME).

Variables de entorno de Hadoop (HADOOP_HOME, HADOOP_CONF_DIR) configuradas por el sistema o inferidas por scripts/config.sh.

Permisos de la cuenta estudiante para ejecutar comandos cliente hdfs dfs.

Nota: La ejecución de comandos administrativos (hdfs namenode -format, start-dfs.sh, stop-dfs.sh) está restringida al usuario de servicio usuario según la configuración del clúster de laboratorio.

4. Relación con el detalle del taller

G. Modularidad y Makefile

El código se organiza en módulos Bash (scripts/*.sh) especializados por responsabilidad (verificación, inicialización, arranque, parada, demo, limpieza).

El Makefile centraliza el flujo de trabajo en targets simples (env, init, start, demo, stop, clean) que orquestan estos módulos.

H. Bonus repo (Repositorio del proyecto)

Este repositorio contiene:

La configuración de Hadoop utilizada.

Los scripts modulares.

El Makefile.

El enunciado y el informe.

Permite que cualquier persona con acceso al mismo clúster:

Clone el repositorio.

Ajuste, si es necesario, scripts/config.sh.

Ejecute make env y make demo (con el clúster levantado por usuario) para reproducir la parte práctica del taller.
