# == Schema Information
#
# Table name: room_users
#
#  id      :integer          not null, primary key
#  room_id :integer
#  user_id :integer
#

class RoomUser < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
end
