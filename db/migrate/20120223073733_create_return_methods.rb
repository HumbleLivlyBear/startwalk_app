class CreateReturnMethods < ActiveRecord::Migration

  def self.up
    create_table :return_methods do |t|
      t.integer :project_id
      t.integer :money1
      t.integer :money2
      t.integer :money3
      t.integer :money4
      t.integer :money5
      t.integer :money6
      t.integer :money7
      t.integer :money8
      t.integer :money9
      t.integer :money10
      t.string :method1
      t.string :method2
      t.string :method3
      t.string :method4
      t.string :method5
      t.string :method6
      t.string :method7
      t.string :method8
      t.string :method9
      t.string :method10
      t.integer :position

      t.timestamps
    end

    add_index :return_methods, :id

    load(Rails.root.join('db', 'seeds', 'return_methods.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "return_methods"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/return_methods"})
    end

    drop_table :return_methods
  end

end
