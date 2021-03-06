#!/bin/bash
echo "" > classpath.txt

for file in `ls lib`;
        do echo -n 'lib/' >> classpath.txt;
        echo -n $file >> classpath.txt;
        echo -n ':' >> classpath.txt;
done

export CLASSPATH=$(cat classpath.txt)
JAVA_CONFIG_OPTIONS="-Xms500m -Xmx1000m -XX:NewSize=200m -XX:MaxNewSize=200m -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:PermSize=100m -XX:MaxPermSize=100m"
export JAVA_OPTS="-Duser.timezone=GMT ${JAVA_CONFIG_OPTIONS} ${JAVA_DEBUG_OPTIONS} "

java $WORDNIK_OPTS $JAVA_CONFIG_OPTIONS $JAVA_OPTS -cp $CLASSPATH "$@"
