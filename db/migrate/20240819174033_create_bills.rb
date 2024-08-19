class CreateBills < ActiveRecord::Migration[7.2]
  def change
    create_table :bills do |t|
      t.integer :amount
      t.integer :status
      t.integer :bill_type
      t.integer :submitted_by

      t.timestamps
    end
  end
end
