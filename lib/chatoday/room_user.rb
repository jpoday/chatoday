module ChatODay
  class RoomUser < ActiveRecord::Base
    belongs_to :room
    belongs_to :user

  end
end