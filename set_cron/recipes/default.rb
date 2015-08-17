app_name = node[:opsworks][:applications][0][:name]
rails_env = node[:deploy][app_name][:rails_env]
env_hash = node[:deploy][app_name][:environment]

execute 'whenever' do
  cwd "/srv/www/#{app_name}/current"
  command "bundle exec whenever --update-cron -f config/schedule_check.rb"
  environment env_hash.merge(RAILS_ENV: rails_env)
  user 'deploy'
end

