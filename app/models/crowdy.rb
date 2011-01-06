class Crowdy < ActiveRecord::Base
	validates :name, :presence => true,
			 :length => { :minimum => 3 }
	validates :title, :presence => true
	validates :question, :presence => true
	validates :desired_crowd_choices, :presence => true

	has_many :choices, :dependent => :destroy
end
