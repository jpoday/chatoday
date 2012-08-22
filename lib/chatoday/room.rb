module ChatODay
  class Room
    def initialize(output)
      
    end
    
    def enter(user)
      ChatODay::RoomUser.new(self,user)
      
    end
  end
end