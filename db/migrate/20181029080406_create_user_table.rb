class CreateUserTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tables do |t|
      t.string :name
      t.string :email
    end
  end
end
