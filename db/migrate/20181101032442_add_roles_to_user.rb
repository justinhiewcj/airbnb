class AddRolesToUser < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.string :roles
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :roles
    end
  end
end
