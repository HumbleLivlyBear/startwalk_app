class CreateMembers < ActiveRecord::Migration

  def self.up
    create_table :members do |t|
      t.string :member_name
      t.string :email
      t.integer :member_photo_id
      t.text :bio
      t.text :personal_link
      t.string :password
      t.integer :position

      t.timestamps
    end

    add_index :members, :id

    load(Rails.root.join('db', 'seeds', 'members.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "members"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/members"})
    end

    drop_table :members
  end

end
