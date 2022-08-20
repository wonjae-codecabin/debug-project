# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_20_045230) do
  create_table "entries", force: :cascade do |t|
    t.integer "trap_id", null: false
    t.string "unique_identifier"
    t.string "activity_date"
    t.string "activity_class"
    t.string "surveillance_type"
    t.string "survey_name_or_id"
    t.string "inspection_method"
    t.string "inspection_unit"
    t.string "trap_type"
    t.string "lure_type"
    t.string "host_scientific_name"
    t.string "land_use"
    t.string "type_of_sample"
    t.string "type_of_goods"
    t.string "no_of_unit_inspected"
    t.string "target_pest_common_name"
    t.string "target_pest_species_name"
    t.string "target_spp"
    t.string "other"
    t.string "species_identified1"
    t.string "species_identified1_no"
    t.string "species_identified2"
    t.string "species_identified2_no"
    t.string "species_identified3"
    t.string "species_identified3_no"
    t.string "species_identified4"
    t.string "species_identified4_no"
    t.string "species_identified5"
    t.string "species_identified5_no"
    t.string "lims_reference_number"
    t.string "diagnostic_service"
    t.string "date_identified"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trap_id"], name: "index_entries_on_trap_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "contact_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.integer "owner_id", null: false
    t.text "description"
    t.string "jurisdiction"
    t.string "organisation_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "town_or_suburb"
    t.index ["owner_id"], name: "index_properties_on_owner_id"
  end

  create_table "traps", force: :cascade do |t|
    t.string "trap_site_id"
    t.integer "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_traps_on_property_id"
  end

  add_foreign_key "entries", "traps"
  add_foreign_key "properties", "owners"
  add_foreign_key "traps", "properties"
end
