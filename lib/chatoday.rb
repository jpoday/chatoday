require 'rubygems'
require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'db/test.sqlite3')

require 'chatoday/user'
require 'chatoday/room'
require 'chatoday/room_user'