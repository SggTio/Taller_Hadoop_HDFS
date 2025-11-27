export SPARK_HOME="/nfs/condor/spark"
export SPARK_CONF_DIR="$SPARK_HOME/conf"
export PATH="$SPARK_HOME/bin":$PATH
export PYSPARK_PYTHON="/usr/local/bin/python3"
export PYSPARK_DRIVER_PYTHON="/usr/local/bin/python3"
export PATH=$PATH:/usr/lib64/openmpi/bin

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.472.b08-1.el9.x86_64
export PATH=$JAVA_HOME/bin:$PATH

export HADOOP_HOME=/mnt/Cluster/Hadoop
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_YARN_HOME=$HADOOP_HOME
export HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin

# HDFS Users
export HDFS_NAMENODE_USER="$USER"
export HDFS_DATANODE_USER="$USER"
export HDFS_SECONDARYNAMENODE_USER="$USER"