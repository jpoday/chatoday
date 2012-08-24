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
end
