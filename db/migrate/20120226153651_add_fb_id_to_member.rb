class AddFbIdToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :fb_id, :integer
  end

  def self.down
    remove_column :members, :fb_id
  end
end
