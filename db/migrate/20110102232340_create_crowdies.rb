class CreateCrowdies < ActiveRecord::Migration
  def self.up
    create_table :crowdies do |t|
      t.string :name
      t.string :title
      t.text :question
      t.string :choice1
      t.string :choice2

      t.timestamps
    end
  end

  def self.down
    drop_table :crowdies
  end
end
