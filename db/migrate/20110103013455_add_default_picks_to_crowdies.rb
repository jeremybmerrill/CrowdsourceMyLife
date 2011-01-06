class AddDefaultPicksToCrowdies < ActiveRecord::Migration
  def self.up
	change_table :crowdies do |t|
		t.change_default :picksOfChoice1, 0
		t.change_default :picksOfChoice2, 0
	end
	Crowdy.update_all ["picksOfChoice1 = ?", 0]
	Crowdy.update_all ["picksOfChoice2 = ?", 0]
  end

  def self.down	
  #I can't be damned to write this.
  end
end
