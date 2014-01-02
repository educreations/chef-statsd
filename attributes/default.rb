#
# Cookbook Name:: statsd
# Attributes:: statsd
#

default[:statsd][:user] = 'www-data'
default[:statsd][:group] = 'www-data'

default[:statsd][:base] = '/opt/statsd'
default[:statsd][:config] = 'config.js'

default[:statsd][:port] = 8125
default[:statsd][:graphite_port] = 2003
default[:statsd][:graphite_host] = "localhost"

default[:statsd][:user] = 'statsd'
default[:statsd][:group] = 'statsd'

default[:statsd][:source_url] = "git://github.com/etsy/statsd.git"
default[:statsd][:source_reference] = 'v0.7.0'
default[:statsd][:tmp_dir] = "/tmp"
