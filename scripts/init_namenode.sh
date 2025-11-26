#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.sh"

echo "=== Inicializando NameNode (formateo) ==="
echo
echo "Este taller se ejecuta en un clúster compartido."
echo "El formateo del NameNode (hdfs namenode -format) solo puede ser ejecutado"
echo "por el usuario administrado 'usuario', no por la cuenta 'estudiante'."
echo
echo "Por política del curso asumimos que el NameNode ya fue formateado por el administrador."
echo "Este script se deja por modularidad, pero NO ejecuta el formateo real."
echo
echo "Nada que hacer: saliendo sin errores."

exit 0

