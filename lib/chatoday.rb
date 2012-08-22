require 'rubygems'
require 'active_record'
require 'sqlite3'
require 'yaml'
require 'logger'

dbconfig = YAML::load(File.open('db/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

require 'chatoday/user'
require 'chatoday/room'
require 'chatoday/room_user'