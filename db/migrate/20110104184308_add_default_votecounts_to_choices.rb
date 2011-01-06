class AddDefaultVotecountsToChoices < ActiveRecord::Migration
  def self.up
	change_table :choices do |t|
		t.change_default :votecount, 0
	end
	Choice.update_all ["votecount = ?", 0]
  end

  def self.down
  end
end
