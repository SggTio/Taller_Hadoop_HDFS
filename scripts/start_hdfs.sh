#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.sh"

echo "=== Iniciando HDFS ==="
start-dfs.sh

echo
echo "=== Procesos Java activos (jps) ==="
jps -l

echo
echo "=== Resumen del clúster (hdfs dfsadmin -report) ==="
hdfs dfsadmin -report | grep -E "Configured Capacity|DFS Used|DFS Remaining|Live datanodes"
