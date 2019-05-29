class Tag < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :name , :message => " of the Tagged Person is Required"
  validates_length_of :name, :minimum => 5
end
