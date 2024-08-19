class AddDepartmentEmployee < ActiveRecord::Migration[7.2]
  def change
    add_column :employees, :user_id , :integer, null: true
    add_column :employees, :department_id, :integer
  end
end
