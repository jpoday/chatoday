# == Schema Information
#
# Table name: rooms
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#

class Room < ActiveRecord::Base
  has_many :room_users, :dependent => :destroy
  has_many :users,
    :through => :room_users,
    :source => :user
  has_many :comments, :dependent => :destroy
  has_many :interactions, :dependent => :destroy
  has_many :histories, :dependent => :destroy
  
  def start(output)
    @output = output
  end
  
  def enter(user)
    self.room_users.create(:user => user)
    self.histories.create(:event_type => "Entrance", :event_id => user)
    @output.puts "#{formatted_time}: #{user.name} enters the room"
  end
  
  def leave(user)
    id = RoomUser.where("room_id = ? AND user_id = ?", self.id, user.id).pluck(:id)
    RoomUser.delete(id)
    self.histories.create(:event_type => "Exit", :event_id => user)
    @output.puts "#{formatted_time}: #{user.name} leaves"
  end
  
  def display_comment(comment)
    @output.puts "#{formatted_time}: #{comment.user.name} comments: \"#{comment.content}\""
  end
  
  def display_interaction(interaction)
    @output.puts "#{formatted_time}: #{interaction.subject.name} #{interaction.verb.pluralize} #{interaction.receiver.name}"
  end
  
  def summary(granularity)
    case granularity
    when "hourly"
      start_time = self.histories.first.created_at
      end_time = self.histories.last.created_at
      (start_time.hour..end_time.hour).each_with_index do |hour,i|
        @output.puts "#{(start_time+i.hour).strftime("%l%P").strip}:"
        
        entrances = self.histories.where("event_type = ?","Entrance").during_hour(start_time+i.hours).count
        @output.puts "\t#{entrances} #{"person".pluralize(entrances)} entered" if entrances && entrances != 0
        
        exits = self.histories.where("event_type = ?","Exit").during_hour(start_time+i.hours).count
        @output.puts "\t#{exits} left" if exits && exits != 0

        interactions = self.histories.where("event_type = ?","Interaction").during_hour(start_time+i.hours)
        subjects = interactions.collect(&:event).collect(&:subject_id).uniq.count
        receivers = interactions.collect(&:event).collect(&:receiver_id).uniq.count
        if subjects && receivers && subjects != 0 && receivers != 0
          @output.puts "\t#{subjects} #{"person".pluralize(subjects)} high-fived #{receivers} other #{"person".pluralize(receivers)}"
        end
        
        comments = self.histories.where("event_type = ?","Comment").during_hour(start_time+i.hours).count
        @output.puts "\t#{comments} #{"comment".pluralize(comments)}" if comments
      end
    end
  end
  
  private
    def formatted_time
      Time.now.strftime("%l:%M%P").strip
    end
end
