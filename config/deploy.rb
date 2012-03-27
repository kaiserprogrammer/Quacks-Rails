$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
require "bundler/capistrano"
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user

set :user, "deploy"
set :runner, user
set :use_sudo, false

set :application, "quacks-rails"
set :scm, :git
set :repository,  "git@github.com:simpleprogrammer/Quacks-Rails.git"

set :deploy_to, "/var/www/apps/#{application}"
set :deploy_via, :remote_cache

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
