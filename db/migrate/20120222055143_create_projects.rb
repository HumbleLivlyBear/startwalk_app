class CreateProjects < ActiveRecord::Migration

  def self.up
    create_table :projects do |t|
      t.string :case_name
      t.text :gist
      t.text :case_introduce
      t.text :case_update
      t.integer :case_small_photo_id
      t.integer :case_promote_photo_id
      t.integer :wanted_money
      t.integer :current_money
      t.text :return_methods
      t.integer :member_id
      t.integer :class_id
      t.integer :position

      t.timestamps
    end

    add_index :projects, :id

    load(Rails.root.join('db', 'seeds', 'projects.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "projects"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/projects"})
    end

    drop_table :projects
  end

end
