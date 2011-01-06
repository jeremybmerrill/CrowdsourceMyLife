class AddChoiceCountToCrowdies < ActiveRecord::Migration
  def self.up
    add_column :crowdies, :picksOfChoice1, :integer
    add_column :crowdies, :picksOfChoice2, :integer
  end

  def self.down
    remove_column :crowdies, :picksOfChoice2
    remove_column :crowdies, :picksOfChoice1
  end
end
