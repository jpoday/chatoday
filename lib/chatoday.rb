#!/usr/bin/env ruby
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rubygems'
require 'active_record'
require 'sqlite3'
require 'yaml'
require 'logger'
require 'pry'
require 'timecop'

require 'chatoday/user'
require 'chatoday/room'
require 'chatoday/room_user'
require 'chatoday/comment'
require 'chatoday/interaction'
require 'chatoday/history'

dbconfig = YAML::load(File.open('db/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

# Doesn't really make sense to have a chat room without concurrency or multiple users

# unless ENV['RACK_ENV'] == 'test'
#   room = Room.create(:name => "NationBuilder Tech Test")
#   room.start(STDOUT)
#   print "\n>> "
#   while input = gets.chomp
#     input = input.split
#     command = input[0]
#     argument = input[1]
#     case command
#     when "name"
#       unless @user
#         name = argument
#         @user = User.create(:name => name)
#         room.enter(@user)
#       else
#         puts "You already told us your name"
#       end
#     when "quit"
#       if @user
#         room.leave(@user)
#       end
#       puts "Goodbye"
#       break
#     else
#     end
#     print "\n>> "
#   end
# end