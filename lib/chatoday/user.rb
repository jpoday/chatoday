# == Schema Information
#
# Table name: users
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#

class User < ActiveRecord::Base
  has_many :room_users, :dependent => :destroy
  has_many :rooms,
    :through => :room_users,
    :source => :room
  has_many :comments, :dependent => :destroy
  has_many :interactions, :foreign_key => :subject_id, :dependent => :destroy
  has_many :receivers,
    :through => :interactions,
    :source => :receiver
  has_many :reverse_interactions,
    :class_name => "Interaction",
    :foreign_key => :receiver_id
  has_many :subjects,
    :through => :reverse_interactions,
    :source => :subject

  def interacts(verb,other_user,room)
    Interaction.create(:subject => self, :verb => verb, :receiver => other_user, :room => room)
  end
  
  def entrances
    History.where("event_type = ? AND event_id = ?","Entrance",self.id)
  end
  
  def exits
    History.where("event_type = ? AND event_id = ?","Exit",self.id)
  end
end
