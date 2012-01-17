class Site < ActiveRecord::Base
  validates_length_of :url, maximum: 2048
end
