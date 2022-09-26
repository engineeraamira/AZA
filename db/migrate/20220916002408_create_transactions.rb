class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.float :from_amount
      t.integer :from_currency
      t.float :to_amount
      t.integer :to_currency

      t.timestamps
    end
  end
end
