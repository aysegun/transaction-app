class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.references :client, null: false, foreign_key: true
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
