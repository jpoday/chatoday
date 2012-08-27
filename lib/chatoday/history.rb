# == Schema Information
#
# Table name: histories
#
#  id         :integer          not null, primary key
#  room_id    :integer
#  event_id   :integer
#  event_type :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class History < ActiveRecord::Base
  belongs_to :room
  belongs_to :event, polymorphic: true
  
  def self.during_hour(start_time)
    # MySQL hour function could work here, but this solution is database agnostic
    # where("hour(created_at) = ?",start_time.change(:min => 0))
    where("created_at >= ? AND created_at < ?",start_time.change(:min => 0),start_time.change(:min => 0)+1.hour)
  end
  
end
