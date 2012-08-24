# == Schema Information
#
# Table name: interactions
#
#  id          :integer          not null, primary key
#  room_id     :integer
#  verb        :string(255)      default("high-fives")
#  subject_id  :integer
#  receiver_id :integer
#

class Interaction < ActiveRecord::Base
  belongs_to :subject, :class_name => "User", :foreign_key => :subject_id
  belongs_to :receiver, :class_name => "User", :foreign_key => :receiver_id
  belongs_to :room
  has_one :history, :as => :event, :dependent => :destroy
  
  after_save :push_interaction_to_room
  
  def push_interaction_to_room
    self.create_history(:room => room)
    self.room.display_interaction(self)
  end
end
