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

namespace :deploy do
  desc "Start the Thin processes"
  task :start do
    run <<-CMD
      cd #{application_dir}/current; bundle exec thin start -e production -d
    CMD
  end

  desc "Restart the Thin processes"
  task :restart do
    run <<-CMD
      cd #{application_dir}/current; bundle exec thin restart -e production -d
    CMD
  end

  desc "Stop the Thin processes"
  task :stop do
    run <<-CMD
      cd #{application_dir}/current; bundle exec thin stop -e production
    CMD
  end

  desc "Forward all http requests on port 80 to rails server on port 3000"
  task :http_forward_to_rails do

  end

  desc "install rvm on server machine"
  task :install_rvm do
    run <<-CMD
      bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer);
      source ~/.bashrc;
      #{install_package(gcc)};
      #{install_package(zlib)};
      #{install_package(zlib-devel)};
      #{install_package(libopenssl-devel)};
      #{install_package(sqlite3-devel)};
      rvm install ruby-1.9.3;
      rvm use ruby-1.9.3 --default;
      gem install rake;
      gem install bundler;
      sudo zypper install postgresql postgresql-devel postgresql-server;
    CMD
  end

  def install_package(pkg)
    "yes | sudo zypper install #{pkg}"
  end
end
