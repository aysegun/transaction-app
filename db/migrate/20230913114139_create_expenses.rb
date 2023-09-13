class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.text :description
      t.date :date
      t.decimal :amount
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
