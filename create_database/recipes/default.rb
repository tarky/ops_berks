pg_config_path = "/usr/pgsql-#{node['postgresql']['version']}/bin/pg_config"
require 'rbconfig'
gem_package "pg" do
  gem_binary "#{RbConfig::CONFIG['bindir']}/gem"
  options("-- --with-pg-config=#{pg_config_path}")
  action :install
end

include_recipe "database::postgresql"

postgresql_database "inq_development" do
  connection(
    :host      => '127.0.0.1',
    :port      => 5432,
    :username  => 'postgres',
    :password  => node['postgresql']['password']['postgres']
  )
  action :create
end
postgresql_database "inq_test" do
  connection(
    :host      => '127.0.0.1',
    :port      => 5432,
    :username  => 'postgres',
    :password  => node['postgresql']['password']['postgres']
  )
  action :create
end
