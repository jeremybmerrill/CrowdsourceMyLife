class Choice < ActiveRecord::Base
  belongs_to :crowdy

  validates :title, :presence => true, :length => { :minimum => 3 }
end
