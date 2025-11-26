# Makefile para Taller Hadoop HDFS

SHELL := /bin/bash

.PHONY: help env init start stop status demo clean

help:
	@echo "Comandos disponibles:"
	@echo "  make env    - Verificar entorno y configuracion"
	@echo "  make init   - Formatear NameNode (SOLO la primera vez)"
	@echo "  make start  - Iniciar cluster HDFS"
	@echo "  make stop   - Detener cluster HDFS"
	@echo "  make status - Mostrar estado del cluster"
	@echo "  make demo   - Ejecutar comandos de demostracion HDFS"
	@echo "  make clean  - Limpiar datos de pruebas en HDFS"

env:
	./scripts/check_env.sh

init:
	./scripts/init_namenode.sh

start:
	./scripts/start_hdfs.sh

stop:
	./scripts/stop_hdfs.sh

status:
	hdfs dfsadmin -report

demo:
	./scripts/hdfs_demo.sh

clean:
	./scripts/clean_hdfs.sh
