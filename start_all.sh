#!/bin/bash

cd /home/elasticsearch-7.10.2/

sudo sysctl -w vm.max_map_count=262144

RACK=`hostnamectl | head -1 | awk -F":" '{print $2}' | xargs |awk -F"." '{print $1}'` 
# assuming you use FQDN in hostname. We set hostname as RACK for pyhsical node availability.

export ES_PATH_CONF=/home/elasticsearch-7.10.2/config 
# The YML file contains common attributes. Changing attributes are set below before running.


if [[ "$RACK" = "type1-XYZ" ]]; then
    # We set rack attributes for physical node availability.
   ./bin/elasticsearch -d -Enode.name=$RACK-0 -Enode.attr.rack=r-$RACK -Ehttp.port=9200 -Etransport.tcp.port=9300 -Epath.logs=/home/elasticsearch-7.10.2/logs0 -Epath.data=/data1,/data2,/data3 
   ./bin/elasticsearch -d -Enode.name=$RACK-1 -Enode.attr.rack=r-$RACK -Ehttp.port=9201 -Etransport.tcp.port=9301 -Epath.logs=/home/elasticsearch-7.10.2/logs1 -Epath.data=/data4,/data5,/data6 
   ./bin/elasticsearch -d -Enode.name=$RACK-2 -Enode.attr.rack=r-$RACK -Ehttp.port=9202 -Etransport.tcp.port=9302 -Epath.logs=/home/elasticsearch-7.10.2/logs2 -Epath.data=/data7,/data8,/data9 
   ./bin/elasticsearch -d -Enode.name=$RACK-3 -Enode.attr.rack=r-$RACK -Ehttp.port=9203 -Etransport.tcp.port=9303 -Epath.logs=/home/elasticsearch-7.10.2/logs3 -Epath.data=/data10,/data11,/data12 
   ./bin/elasticsearch -d -Enode.name=$RACK-4 -Enode.attr.rack=r-$RACK -Ehttp.port=9204 -Etransport.tcp.port=9304 -Epath.logs=/home/elasticsearch-7.10.2/logs4 -Epath.data=/data13,/data14 
elif [[ "$RACK" = "type2-XYZ" ]]; then
   ./bin/elasticsearch -d -Enode.name=$RACK-0 -Enode.attr.rack=r-$RACK -Ehttp.port=9200 -Etransport.tcp.port=9300 -Epath.logs=/home/elasticsearch-7.10.2/logs0 -Epath.data=/data1,/data2,/data3,/data4,/data5
   ./bin/elasticsearch -d -Enode.name=$RACK-1 -Enode.attr.rack=r-$RACK -Ehttp.port=9201 -Etransport.tcp.port=9301 -Epath.logs=/home/elasticsearch-7.10.2/logs1 -Epath.data=/data6,/data7,/data8,/data9,/data10 
   ./bin/elasticsearch -d -Enode.name=$RACK-2 -Enode.attr.rack=r-$RACK -Ehttp.port=9202 -Etransport.tcp.port=9302 -Epath.logs=/home/elasticsearch-7.10.2/logs2 -Epath.data=/data11,/data12,/data13,/data14,/data15 
   ./bin/elasticsearch -d -Enode.name=$RACK-3 -Enode.attr.rack=r-$RACK -Ehttp.port=9203 -Etransport.tcp.port=9303 -Epath.logs=/home/elasticsearch-7.10.2/logs3 -Epath.data=/data16,/data17,/data18,/data19,/data20 
   ./bin/elasticsearch -d -Enode.name=$RACK-4 -Enode.attr.rack=r-$RACK -Ehttp.port=9204 -Etransport.tcp.port=9304 -Epath.logs=/home/elasticsearch-7.10.2/logs4 -Epath.data=/data21,/data22,/data23,/data24
fi

echo "*** All instances have been started ***"
