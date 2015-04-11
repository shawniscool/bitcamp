class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.text :content

      t.timestamps null: false
    end
  end
end
