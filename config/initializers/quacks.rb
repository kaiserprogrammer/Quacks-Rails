require "quacks/persistent"
require "quacks/presenter"
require_relative "../../app/views/authors/authors_view"
require_relative "../../app/views/authors/author_view"
require_relative "../../app/views/users/users_view"
require_relative "../../app/views/users/user_view"

db = YAML.load(File.new(Rails.root + "config/database.yml"))
DB.setup(:default, db[Rails.env])
