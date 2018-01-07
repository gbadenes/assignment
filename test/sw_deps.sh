#!/bin/bash

### Check dependencies for Discourse
## Postgres 9.5+
## Redis 2.6+
## Ruby 2.3+
POSTGRES_V=`psql --version | awk -F" " '{print $3}'`
REDIS_V=`redis-server --version | awk -F" " '{print $3}'`
RUBY_V=`ruby --version | awk -F" " '{print $2}'`
POSTGRES=0
REDIS=0
RUBY=0

echo "Checking versions"
if [ $POSTGRES_V == "9.5.10" ]
then
        echo "Postgres $POSTGRES_V..........OK"
else
        echo "Postgres version...FAIL"
        POSTGRES=1
fi


if [ $RUBY_V == "2.3.1p112" ]
then
        echo "Ruby $RUBY_V..........OK"
else
        echo "Ruby version...FAIL"
        RUBY=1
fi

if [ $REDIS_V == "v=4.0.6" ]
then
        echo "Redis-server $REDIS_V..........OK"
else
        echo "Redis version...FAIL"
        REDIS=1
fi

if [ $POSTGRES -ne 0 ] || [ $RUBY -ne 0 ] || [ $REDIS -ne 0 ]
then
        exit 1
fi

exit 0
