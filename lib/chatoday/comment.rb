class Comment < ActiveRecord::Base
  validates_presence_of :content
  
  belongs_to :user
  belongs_to :room
  
  after_save :push_comment_to_room
  
  def push_comment_to_room
    self.room.display_comment(self)
  end
end
