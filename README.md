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

### `config/`

Contiene la configuración de Hadoop empleada en el taller:

- `core-site.xml`: Define `fs.defaultFS` (ej. `hdfs://IPMASTER:9000`) y directorios temporales.
- `hdfs-site.xml`: Parámetros de HDFS (`dfs.replication`, `dfs.name.dir`, `dfs.data.dir`).
- `hadoop-env.sh`: Variables de entorno (`JAVA_HOME`, `HADOOP_OPTS`).
- `workers`: Lista de nodos worker del clúster (`cadhead02`, `cad02-w000`, etc.).

Estos archivos sirven como **referencia** de la configuración del clúster. En un entorno donde tengas permisos de administrador, estos archivos deberían copiarse a `$HADOOP_HOME/etc/hadoop` o definirse mediante `HADOOP_CONF_DIR`.

### `scripts/`

Scripts Bash que encapsulan la lógica del taller:

- `config.sh`: Configuración común. Detecta `JAVA_HOME` y `HADOOP_HOME`.
- `check_env.sh`: Verifica variables de entorno y la presencia de archivos de configuración.
- `init_namenode.sh`: Módulo conceptual. Documenta el comando `hdfs namenode -format` (requiere admin).
- `start_hdfs.sh`: Verifica si el clúster está activo mediante `jps` y `hdfs dfsadmin -report`.
- `stop_hdfs.sh`: Documenta la detención de servicios.
- `hdfs_demo.sh`: Script principal de demostración. Ejecuta comandos HDFS como cliente:
    - Creación de directorios (`mkdir`)
    - Carga y descarga de archivos (`put`, `get`)
    - Operaciones de gestión (`cp`, `mv`, `rm`)
    - Estadísticas (`du`, `stat`)
- `clean_hdfs.sh`: Elimina el directorio de pruebas `/pruebas_hdfs`.

---

## 2. Uso del Makefile

El Makefile expone las tareas principales como comandos `make`:

```bash
help:
	@echo "Comandos disponibles:"
	@echo "  make env    - Verificar entorno y configuracion"
	@echo "  make init   - Formatear NameNode (SOLO la primera vez)"
	@echo "  make start  - Iniciar cluster HDFS"
	@echo "  make stop   - Detener cluster HDFS"
	@echo "  make status - Mostrar estado del cluster"
	@echo "  make demo   - Ejecutar comandos de demostracion HDFS"
	@echo "  make clean  - Limpiar datos de pruebas en HDFS"
```

### Flujo de Trabajo Sugerido

1. **Verificar entorno**:
   ```bash
   make env
   ```
   Confirma que `JAVA_HOME` y `HADOOP_HOME` son detectados y que los archivos de configuración en `config/` existen (o en el directorio de sistema).

2. **Verificar estado del clúster**:
   ```bash
   make start
   ```
   Si el clúster está activo (gestionado por el administrador), mostrará el reporte de nodos. Si no, indicará error de conexión.

3. **Ejecutar la demostración**:
   ```bash
   make demo
   ```
   **Nota:** Requiere que el clúster esté en ejecución.
   Este script realizará automáticamante:
   - Creación de archivos locales de prueba.
   - Subida de archivos a HDFS (`/pruebas_hdfs`).
   - Pruebas de manipulación de archivos (copiar, mover, ver contenido).
   - Descarga y verificación.
   - Limpieza parcial.

   > **Nota sobre Warnings:** Es posible que observes advertencias del tipo `WARN hdfs.DataStreamer: Exception in createBlockOutputStream` o `No route to host`. Esto es común en entornos de laboratorio compartidos si algún DataNode está saturado o inactivo temporalmente. HDFS intentará recuperarse automáticamente replicando en otro nodo disponible (verás mensajes de `Error Recovery` y luego éxito en la operación).

4. **Limpieza final**:
   ```bash
   make clean
   ```
   Elimina los directorios creados en HDFS para dejar el sistema limpio.

---

## 3. Configuración Manual (Opcional)

Si deseas ejecutar estos scripts en un entorno propio (no el del laboratorio), puedes usar la configuración incluida en `config/`.

1. Asegúrate de tener Java 8 y Hadoop instalados.
2. Exporta la variable `HADOOP_CONF_DIR` apuntando a la carpeta `config/` de este repositorio (o copia los archivos a tu instalación):
   ```bash
   export HADOOP_CONF_DIR=$(pwd)/config
   ```
3. Ajusta `core-site.xml` con la IP de tu Master (o `localhost` si es pseudo-distribuido).
4. Ajusta `workers` con los hostnames de tus nodos.

---

## 4. Relación con el Taller

### G. Modularidad y Makefile
El código se organiza en módulos Bash (`scripts/*.sh`) especializados por responsabilidad. El `Makefile` orquesta estos módulos para facilitar la ejecución y corrección.

### H. Bonus Repo
Este repositorio cumple con el requerimiento de entregar un proyecto estructurado, documentado y reproducible. Permite:
- Clonar el repo.
- Verificar el entorno (`make env`).
- Ejecutar la batería de pruebas (`make demo`) de forma automatizada.
