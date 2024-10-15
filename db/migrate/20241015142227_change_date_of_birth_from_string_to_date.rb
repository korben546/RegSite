class ChangeDateOfBirthFromStringToDate < ActiveRecord::Migration[7.2]
  def change
    change_column(:con_registrations, :date_of_birth, :date)
  end
end
