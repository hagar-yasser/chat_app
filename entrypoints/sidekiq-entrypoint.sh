#!/bin/sh
cd instabugtask
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi
 
bundle exec sidekiq