#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.sh"

BASE_DIR=/pruebas_hdfs

echo "=== Eliminando directorios de prueba en HDFS ==="
hdfs dfs -rm -r -f "$BASE_DIR" || echo "No existía $BASE_DIR"
echo "Limpieza de HDFS de pruebas completada."
