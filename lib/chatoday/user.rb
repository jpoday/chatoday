module ChatODay
  class User < ActiveRecord::Base
    has_many :room_users
    has_many :rooms,
      :through => :room_users,
      :source => :room
  end
end