#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.sh"

echo "=== Verificando variables de entorno ==="
echo "JAVA_HOME: $JAVA_HOME"
echo "HADOOP_HOME: $HADOOP_HOME"
echo "HADOOP_CONF_DIR: $HADOOP_CONF_DIR"

echo
echo "=== Verificando archivos de configuración ==="
ls -la "$HADOOP_CONF_DIR" | grep -E "core-site.xml|hdfs-site.xml|hadoop-env.sh|workers" || {
  echo "Faltan archivos de configuración críticos."
  exit 1
}

echo
echo "=== Validando parámetros clave ==="
grep -A2 "fs.defaultFS" "$HADOOP_CONF_DIR/core-site.xml" || echo "fs.defaultFS no encontrado"
grep -A2 "dfs.replication" "$HADOOP_CONF_DIR/hdfs-site.xml" || echo "dfs.replication no encontrado"
grep "export JAVA_HOME" "$HADOOP_CONF_DIR/hadoop-env.sh" || echo "JAVA_HOME no encontrado en hadoop-env.sh"
cat "$HADOOP_CONF_DIR/workers"

echo
echo "Entorno verificado."
