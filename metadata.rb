maintainer        "Educreations, Inc."
maintainer_email  "chris@educreations.com"
license           "Apache 2.0"
description       "Sets up an environment for statsd instances."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version           "0.0.1"
suggests          "ruby"

recipe "default", "Sets up statsd to collect and forward to graphite."

%w{ debian ubuntu }.each do |os|
  supports os
end

%w{ git nodejs supervisor }.each do |cb|
  depends cb
end
