class CreateChoices < ActiveRecord::Migration
  def self.up
    create_table :choices do |t|
      t.string :imgurl
      t.string :title
      t.integer :votecount
      t.references :crowdy

      t.timestamps
    end
  end

  def self.down
    drop_table :choices
  end
end
