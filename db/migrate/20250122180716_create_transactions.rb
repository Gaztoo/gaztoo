class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.boolean :is_paid, default: false
      t.datetime :due_date, null: false
      t.integer :value, null: false
      t.references :category, null: false, foreign_key: true
      t.string :recurrency_token

      t.timestamps
    end
  end
end
