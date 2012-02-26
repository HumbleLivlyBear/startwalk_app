class CreateSponsorships < ActiveRecord::Migration
  def self.up
    create_table :sponsorships do |t|
      t.integer :member_id
      t.integer :case_id
      t.integer :sponsored_money
      t.text :selected_return

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsorships
  end
end
