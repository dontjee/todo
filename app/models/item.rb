# == Schema Information
# Schema version: 20110102005702
#
# Table name: items
#
#  id         :integer         not null, primary key
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Item < ActiveRecord::Base
end
