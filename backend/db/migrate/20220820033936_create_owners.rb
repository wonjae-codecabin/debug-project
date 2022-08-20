class CreateOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :contact_number
      t.string :email

      t.timestamps
    end
  end
end
