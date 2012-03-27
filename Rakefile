#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

QuacksRails::Application.load_tasks

namespace :db do
  task :migrate do
    require "quacks/persistent"
    db = YAML.load(File.new(Rails.root + "config/database.yml"))
    DB.setup(:default, db[Rails.env])
    DataMapper.auto_upgrade!
  end
end
