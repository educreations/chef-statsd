name                "statsd"
maintainer          "Educreations, Inc."
maintainer_email    "chris@educreations.com"
license             "MIT"
description         "Sets up an environment for statsd instances."
long_description    IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version             "0.0.1"

%w{ debian ubuntu }.each do |os|
  supports os
end

depends 'git'
depends 'nodejs'
depends 'supervisor'
