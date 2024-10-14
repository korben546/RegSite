class CreateConRegistrations < ActiveRecord::Migration[7.2]
  def change
    create_table :con_registrations do |t|
      t.string :full_name
      t.string :fur_name
      t.date :date_of_birth
      t.string :address_line1
      t.string :address_line2
      t.string :postcode
      t.string :county
      t.string :city
      t.string :country
      t.string :tel
      t.string :disability
      t.string :medical
      t.boolean :accepted

      t.timestamps
    end
  end
end
