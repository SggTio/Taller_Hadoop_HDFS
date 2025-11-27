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
echo "Archivo de prueba 3" > "$LOCAL_SRC/prueba3.txt"

echo
echo "=== 1. Listar archivos (ls) ==="
echo "Ejemplo 1: Listar raíz"
hdfs dfs -ls /
echo "Ejemplo 2: Listar directorio /tmp (común en HDFS)"
hdfs dfs -ls /tmp || echo "/tmp no existe o no accesible"

echo
echo "=== 2. Crear directorios (mkdir) ==="
echo "Ejemplo 1: Crear directorio base y subdirectorio datos"
hdfs dfs -mkdir -p "$BASE_DIR/datos"
echo "Ejemplo 2: Crear directorio de respaldo"
hdfs dfs -mkdir -p "$BASE_DIR/respaldo"
hdfs dfs -ls "$BASE_DIR"

echo
echo "=== 3. Cargar archivos (put) ==="
echo "Ejemplo 1: Subir prueba1.txt"
hdfs dfs -put -f "$LOCAL_SRC/prueba1.txt" "$BASE_DIR/datos/"
echo "Ejemplo 2: Subir prueba2.txt"
hdfs dfs -put -f "$LOCAL_SRC/prueba2.txt" "$BASE_DIR/datos/"
hdfs dfs -ls "$BASE_DIR/datos/"

echo
echo "=== 4. Ver contenido (cat) ==="
echo "Ejemplo 1: Ver prueba1.txt"
hdfs dfs -cat "$BASE_DIR/datos/prueba1.txt"
echo "Ejemplo 2: Ver prueba2.txt"
hdfs dfs -cat "$BASE_DIR/datos/prueba2.txt"

echo
echo "=== 5. Descargar archivos (get) ==="
echo "Ejemplo 1: Descargar prueba1.txt"
hdfs dfs -get -f "$BASE_DIR/datos/prueba1.txt" "$LOCAL_DST/"
echo "Ejemplo 2: Descargar prueba2.txt"
hdfs dfs -get -f "$BASE_DIR/datos/prueba2.txt" "$LOCAL_DST/"
ls -la "$LOCAL_DST"

echo
echo "=== 6. Copiar archivos en HDFS (cp) ==="
echo "Ejemplo 1: Copiar prueba1.txt a respaldo"
hdfs dfs -cp -f "$BASE_DIR/datos/prueba1.txt" "$BASE_DIR/respaldo/"
echo "Ejemplo 2: Copiar prueba2.txt a respaldo"
hdfs dfs -cp -f "$BASE_DIR/datos/prueba2.txt" "$BASE_DIR/respaldo/"
hdfs dfs -ls "$BASE_DIR/respaldo"

echo
echo "=== 7. Mover/Renombrar archivos (mv) ==="
echo "Ejemplo 1: Renombrar prueba2.txt en origen"
hdfs dfs -mv "$BASE_DIR/datos/prueba2.txt" "$BASE_DIR/datos/prueba2_renombrado.txt"
echo "Ejemplo 2: Mover prueba1.txt de respaldo a nueva carpeta 'archivo'"
hdfs dfs -mkdir -p "$BASE_DIR/archivo"
hdfs dfs -mv "$BASE_DIR/respaldo/prueba1.txt" "$BASE_DIR/archivo/"
hdfs dfs -ls "$BASE_DIR/datos"
hdfs dfs -ls "$BASE_DIR/archivo"

echo
echo "=== 8. Uso de disco (du) ==="
echo "Ejemplo 1: Uso de disco en directorio datos"
hdfs dfs -du "$BASE_DIR/datos"
echo "Ejemplo 2: Uso de disco en directorio respaldo"
hdfs dfs -du "$BASE_DIR/respaldo"

echo
echo "=== 9. Resumen de uso de disco (dus / du -s) ==="
echo "Nota: 'dus' es un comando antiguo, equivalente a 'du -s' en versiones modernas."
echo "Ejemplo 1: Resumen de base dir"
hdfs dfs -du -s "$BASE_DIR"
echo "Ejemplo 2: Resumen de directorio datos"
hdfs dfs -du -s "$BASE_DIR/datos"

echo
echo "=== 10. Estadísticas (stat) ==="
echo "Ejemplo 1: Estadísticas formateadas de prueba1.txt"
hdfs dfs -stat "Nombre: %n, Tamaño: %b bytes, Replicas: %r" "$BASE_DIR/datos/prueba1.txt"
echo "Ejemplo 2: Estadísticas de fecha de modificación del directorio datos"
hdfs dfs -stat "Directorio: %n, Modificado: %y" "$BASE_DIR/datos"

echo
echo "=== 11. Eliminar recursivamente (rmr / rm -r) ==="
echo "Nota: 'rmr' es un comando antiguo (deprecated), se recomienda 'rm -r'."
echo "Ejemplo 1: Eliminar carpeta archivo recursivamente"
hdfs dfs -rm -r "$BASE_DIR/archivo"
echo "Ejemplo 2: Eliminar carpeta respaldo recursivamente"
hdfs dfs -rm -r "$BASE_DIR/respaldo"

echo "=== Verificación final ==="
hdfs dfs -ls -R "$BASE_DIR"

echo "Demo HDFS completada."
