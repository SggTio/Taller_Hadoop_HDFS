export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.472.b08-1.el9.x86_64
export HADOOP_PID_DIR=/mnt/sda1/Cluster/pid

# Configuración NameNode para usar parallelGC con 4GB Java Heap
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
export HADOOP_COMMON_LIB_NATIVE_DIR="$HADOOP_HOME/lib/native/"
export HDFS_NAMENODE_OPTS="-XX:+UseParallelGC -Xmx4g"
