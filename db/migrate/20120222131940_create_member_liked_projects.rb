class CreateMemberLikedProjects < ActiveRecord::Migration
  def self.up
    create_table :member_liked_projects do |t|
      t.integer :member_id
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :member_liked_projects
  end
end
