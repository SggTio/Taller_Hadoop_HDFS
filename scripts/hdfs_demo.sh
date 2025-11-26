#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.sh"

BASE_DIR=/pruebas_hdfs
LOCAL_SRC=/tmp/datos_locales
LOCAL_DST=/tmp/descarga_hdfs

echo "=== Preparando entorno local de pruebas ==="
mkdir -p "$LOCAL_SRC" "$LOCAL_DST"
echo "Archivo de prueba 1" > "$LOCAL_SRC/prueba1.txt"
echo "Archivo de prueba 2" > "$LOCAL_SRC/prueba2.txt"

echo
echo "=== Navegación básica ==="
hdfs dfs -ls /
hdfs dfs -mkdir -p "$BASE_DIR/datos"
hdfs dfs -mkdir -p "$BASE_DIR/respaldo"
hdfs dfs -ls "$BASE_DIR"

echo
echo "=== Transferencia de datos (put / cat / get) ==="
hdfs dfs -put "$LOCAL_SRC/prueba1.txt" "$BASE_DIR/datos/"
hdfs dfs -put "$LOCAL_SRC/prueba2.txt" "$BASE_DIR/datos/"
hdfs dfs -ls "$BASE_DIR/datos/"

hdfs dfs -cat "$BASE_DIR/datos/prueba1.txt"
hdfs dfs -cat "$BASE_DIR/datos/prueba2.txt"

hdfs dfs -get "$BASE_DIR/datos/prueba1.txt" "$LOCAL_DST/"
hdfs dfs -get "$BASE_DIR/datos/prueba2.txt" "$LOCAL_DST/"
ls -la "$LOCAL_DST"

echo
echo "=== Operaciones internas (cp / mv / du / dus / stat) ==="
hdfs dfs -cp "$BASE_DIR/datos/prueba1.txt" "$BASE_DIR/respaldo/"
hdfs dfs -mv "$BASE_DIR/datos/prueba2.txt" "$BASE_DIR/datos/prueba2_renombrado.txt"

hdfs dfs -du "$BASE_DIR/datos"
hdfs dfs -dus "$BASE_DIR"

hdfs dfs -stat "%b %r %n" "$BASE_DIR/datos/prueba1.txt"
hdfs dfs -stat "%b %r %n" "$BASE_DIR/datos/prueba2_renombrado.txt"

echo
echo "=== Limpieza parcial (rmr) ==="
hdfs dfs -rm -r "$BASE_DIR/respaldo"
echo "Demo HDFS completada."
