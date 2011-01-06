class AddImagesToCrowdies < ActiveRecord::Migration
  def self.up
    add_column :crowdies, :crowdyimg, :string
    add_column :crowdies, :choice1img, :string
    add_column :crowdies, :choice2img, :string
  end

  def self.down
    remove_column :crowdies, :choice2img
    remove_column :crowdies, :choice1img
    remove_column :crowdies, :crowdyimg
  end
end
