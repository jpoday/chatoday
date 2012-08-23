module ChatODay
  class Room < ActiveRecord::Base
    has_many :room_users
    has_many :users,
      :through => :room_users,
      :source => :user
    has_many :comments
    
    def start(output)
      @output = output
    end
    
    def enter(user)
      RoomUser.create(:room => self, :user => user)
      @output.puts "#{user.name} enters the room"
    end
    
    def leave(user)
      id = RoomUser.where("room_id = ? AND user_id = ?", self.id, user.id).pluck(:id)
      RoomUser.delete(id)
      @output.puts "#{user.name} leaves"
    end
    
    def display_comment(comment)
      @output.puts "#{comment.user.name} comments: \"#{comment.content}\""
    end
  end
end