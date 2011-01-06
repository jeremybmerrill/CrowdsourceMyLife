class AddNumOfCrowdChoicesToCrowdies < ActiveRecord::Migration
  def self.up
    add_column :crowdies, :desired_crowd_choices, :integer
  end

  def self.down
    remove_column :crowdies, :desired_crowd_choices
  end
end
