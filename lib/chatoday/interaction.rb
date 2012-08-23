class Interaction < ActiveRecord::Base
  belongs_to :subject, :class_name => "User", :foreign_key => :subject_id
  belongs_to :receiver, :class_name => "User", :foreign_key => :receiver_id
  belongs_to :room
  
  after_save :push_interaction_to_room
  
  def push_interaction_to_room
    self.room.display_interaction(self)
  end
end