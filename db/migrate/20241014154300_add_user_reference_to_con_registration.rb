class AddUserReferenceToConRegistration < ActiveRecord::Migration[7.2]
  def change
    add_reference :con_registrations, :user, null: false, foreign_key: true
  end
end
