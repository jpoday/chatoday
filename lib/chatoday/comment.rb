# == Schema Information
#
# Table name: comments
#
#  id      :integer          not null, primary key
#  content :string(255)
#  room_id :integer
#  user_id :integer
#

class Comment < ActiveRecord::Base
  validates_presence_of :content
  
  belongs_to :user
  belongs_to :room
  has_one :history, :as => :event, :dependent => :destroy
  
  after_save :push_comment_to_room
  
  def push_comment_to_room
    self.create_history(:room => self.room)
    self.room.display_comment(self)
  end
end
