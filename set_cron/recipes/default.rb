app_name = :inq
rails_env = node[:deploy][app_name][:rails_env]
env_hash = node[:deploy][app_name][:environment]
current_release = release_path

execute 'whenever' do
  cwd current_release
  command "bundle exec whenever --update-cron -f config/schedule_check.rb"
  environment env_hash.merge(RAILS_ENV: rails_env)
  user 'deploy'
  group 'nginx'
end

