$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
require "bundler/capistrano"
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user

set :user, "deploy"
set :runner, user
set :use_sudo, false

set :application, "quacks-rails"
set :application_dir, "/var/www/apps/#{application}"
set :scm, :git
set :repository,  "git@github.com:simpleprogrammer/Quacks-Rails.git"

set :deploy_to, "#{application_dir}"
set :deploy_via, :copy

set :domain, "juergenbickert.de"
role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  ""# your slave db-server here

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

set :rails_env, "production"
set :user, "deploy"
set :runner, user

namespace :deploy do
  desc "Start the Thin processes"
  task :start do
    run <<-CMD
      cd #{application_dir}/current; bundle exec thin restart -e production
    CMD
  end

  desc "Restart the Thin processes"
  task :restart do
    run <<-CMD
      cd #{application_dir}/current; bundle exec thin restart -e production
    CMD
  end

  desc "Stop the Thin processes"
  task :stop do
    run <<-CMD
      cd #{application_dir}/current; bundle exec thin stop -e production
    CMD
  end
end
