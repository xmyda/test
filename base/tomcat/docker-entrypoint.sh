#!/bin/bash

set -e


if [[ -n "$JAVA_MEM_OPTS" ]]; then
	sed -i "/^JAVA_MEM_OPTS/s#\(JAVA_MEM_OPTS=\).*#\1\"$JAVA_MEM_OPTS\"#" /data/tomcat/bin/catalina.sh
fi

echo "-------------------------------------------------------------------------------"
CMD="/data/tomcat/bin/catalina.sh run"
trap "kill -15 -1" EXIT KILL
exec $CMD
