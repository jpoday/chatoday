ENV['RACK_ENV'] = 'test'

$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'chatoday'

require 'ruby-debug'
require 'factory_girl'
FactoryGirl.find_definitions

After do
  Timecop.return
end