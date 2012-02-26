class CreateMemberHostProjects < ActiveRecord::Migration
  def self.up
  # drop_table :member_host_projects
    
    create_table :member_host_projects do |t|
      t.integer :member_id
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :member_host_projects
  end
end
