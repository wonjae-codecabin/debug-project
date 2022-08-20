class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.references :owner, null: false, foreign_key: true
      t.text :description
      t.string :jurisdiction
      t.string :organisation_name

      t.timestamps
    end
  end
end
