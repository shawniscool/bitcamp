class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.text :content

      t.timestamps null: false
    end
  end
end
