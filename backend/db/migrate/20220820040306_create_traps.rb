class CreateTraps < ActiveRecord::Migration[7.0]
  def change
    create_table :traps do |t|
      t.string :trap_site_id
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# Owner.create(name: "", contact_number: "", email: "")
# Property.create(address: "")
# Trap.create(unique_identifier: string, organisation_name: string, jurisdiction: string, 
#   town_or_suburb: string, trap_site_id: string, activity_class: string, surveillance_type: string)