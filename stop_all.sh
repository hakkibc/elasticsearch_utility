# Put this file into /home/elasticsearch-7.10.2/
ps -ef | grep elastic+ |grep elasticsearch | grep java | grep -v grep | awk '{print $2}' | xargs kill -9 $1
