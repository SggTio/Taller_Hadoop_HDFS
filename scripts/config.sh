#!/usr/bin/env bash
set -e

# ============================================================================
# Configuración común para todos los scripts del taller
# - No sobreescribe variables del clúster (HADOOP_HOME, HADOOP_CONF_DIR)
# - Intenta inferir rutas solo si no están definidas
# ============================================================================

# 1) JAVA_HOME: si el clúster ya lo define, lo respetamos
if [ -z "${JAVA_HOME:-}" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.472.b08-1.el9.x86_64
fi

# 2) HADOOP_HOME: respetar valor existente; si no, inferir desde 'hdfs'
if [ -z "${HADOOP_HOME:-}" ]; then
  HDFS_BIN="$(command -v hdfs || true)"
  if [ -n "$HDFS_BIN" ]; then
    # hdfs suele estar en $HADOOP_HOME/bin/hdfs
    export HADOOP_HOME="$(cd "$(dirname "$HDFS_BIN")/.." && pwd)"
  fi
fi

# 3) HADOOP_CONF_DIR: respetar valor existente; si no, probar rutas típicas
if [ -z "${HADOOP_CONF_DIR:-}" ]; then
  if [ -n "${HADOOP_HOME:-}" ] && [ -d "$HADOOP_HOME/etc/hadoop" ]; then
    export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
  elif [ -d "/etc/hadoop" ]; then
    # Muchos clústeres instalan la config en /etc/hadoop
    export HADOOP_CONF_DIR="/etc/hadoop"
  fi
fi

# 4) PATH: añadir binarios de Hadoop si conocemos HADOOP_HOME
if [ -n "${HADOOP_HOME:-}" ]; then
  export PATH="$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin"
fi

