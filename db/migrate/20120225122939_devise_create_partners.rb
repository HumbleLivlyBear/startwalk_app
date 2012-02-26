class DeviseCreatePartners < ActiveRecord::Migration
  def self.up
    create_table(:partners) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :partners, :email,                :unique => true
    add_index :partners, :reset_password_token, :unique => true
    # add_index :partners, :confirmation_token,   :unique => true
    # add_index :partners, :unlock_token,         :unique => true
    # add_index :partners, :authentication_token, :unique => true
  end

  def self.down
    drop_table :partners
  end
end
