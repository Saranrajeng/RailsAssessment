class AddUser < ActiveRecord::Migration[7.2]
  def change
    add_column :employees, :user_id , :integer, null: true
  end
end
