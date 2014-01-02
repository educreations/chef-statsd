include_recipe "git"
include_recipe "nodejs"
include_recipe "supervisor"


# Install the statsd app

directory node[:statsd][:base] do
  owner node[:statsd][:user]
  group node[:statsd][:group]
end


git node[:statsd][:base] do
  repository node[:statsd][:source_url]
  reference node[:statsd][:source_reference]
  user node[:statsd][:user]
  group node[:statsd][:group]
  action :sync
  notifies :restart, "supervisor_service[statsd]"
end

template "#{node[:statsd][:base]}/#{node[:statsd][:config]}" do
  source "config.js.erb"
  owner node[:statsd][:user]
  group node[:statsd][:group]
  mode 0644
  notifies :restart, "supervisor_service[statsd]"
end


# Set up the supervisor process to start statsd

supervisor_service "statsd" do
  action :enable
  command "/usr/bin/node #{node[:statsd][:base]}/stats.js #{node[:statsd][:config]}"
  directory node[:statsd][:base]
  autostart true
  autorestart true
  user node[:statsd][:user]
  redirect_stderr true
  stdout_logfile_backups node[:supervisor][:stdout_logfile_backups]
  stdout_logfile_maxbytes node[:supervisor][:stdout_logfile_maxbytes]
  stderr_logfile_backups node[:supervisor][:stderr_logfile_backups]
  stderr_logfile_maxbytes node[:supervisor][:stderr_logfile_maxbytes]
end
