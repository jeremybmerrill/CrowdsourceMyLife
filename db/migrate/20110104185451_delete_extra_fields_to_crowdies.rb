class DeleteExtraFieldsToCrowdies < ActiveRecord::Migration
  def self.up
	remove_column :crowdies, :choice1
	remove_column :crowdies, :choice2
	remove_column :crowdies, :picksOfChoice1
	remove_column :crowdies, :picksOfChoice2
	remove_column :crowdies, :choice1img
	remove_column :crowdies, :choice2img
  end
  def self.down
	add_column :crowdies, :choice1, :varchar => 255
	add_column :crowdies, :choice2, :varchar => 255
	add_column :crowdies, :picksOfChoice1, :integer
	add_column :crowdies, :picksOfChoice2,:integer
    change_default :picksOfChoice1, 0
    change_default :picksOfChoice2, 0
	add_column :crowdies, :choice1img, :varchar => 255
	add_column :crowdies, :choice2img, :varchar => 255
  end
end
