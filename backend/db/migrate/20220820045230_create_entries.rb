class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.references :trap, null: false, foreign_key: true
      t.string :unique_identifier
      t.string :activity_date
      t.string :activity_class
      t.string :surveillance_type
      t.string :survey_name_or_id
      t.string :inspection_method
      t.string :inspection_unit
      t.string :trap_type
      t.string :lure_type
      t.string :host_scientific_name
      t.string :land_use
      t.string :type_of_sample
      t.string :type_of_goods
      t.string :no_of_unit_inspected
      t.string :target_pest_common_name
      t.string :target_pest_species_name
      t.string :target_spp
      t.string :other
      t.string :species_identified1
      t.string :species_identified1_no
      t.string :species_identified2
      t.string :species_identified2_no
      t.string :species_identified3
      t.string :species_identified3_no
      t.string :species_identified4
      t.string :species_identified4_no
      t.string :species_identified5
      t.string :species_identified5_no
      t.string :lims_reference_number
      t.string :diagnostic_service
      t.string :date_identified
      t.text :comments
      t.timestamps
    end
  end
end
