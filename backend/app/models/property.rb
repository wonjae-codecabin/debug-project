class Property < ApplicationRecord
  belongs_to :owner

  require 'rubygems'
  require 'json'
  require 'httparty'

  def self.import(file)
    index = 0
    CSV.foreach(file.path, headers: true, encoding: "iso-8859-1:UTF-8") do |row|
        if index > 1
          owner = Owner.order("RANDOM()").first
          property = Property.find_by(
            town_or_suburb: row[3]
          )
          
          #Step 1. Import Property
          # unless property.present?
          
          #   property = Property.find_or_create_by(
          #     owner_id: owner.id,
          #     town_or_suburb: row[3]
          #   )
          #   property.update(
          #     organisation_name: row[1],
          #     jurisdiction: row[2]
          #   )
          # end

          #Step 2. Create a trap
          if property.present?
            #Create trap
            # Trap.find_or_create_by(
            #   trap_site_id: row[4],
            #   property_id: property.id
            # )

            ##Create entry
            trap = Trap.find_by(
              trap_site_id: row[4]
            )
            Entry.create(
              trap_id: trap.id,
              unique_identifier: row[0],
              activity_date: row[5],
              activity_class: row[6],
              surveillance_type: row[7],
              survey_name_or_id: row[8],
              inspection_method: row[9],
              inspection_unit: row[10],
              trap_type: row[11],
              lure_type: row[12],
              host_scientific_name: row[13],
              land_use: row[14],
              type_of_sample: row[15],
              type_of_goods: row[16],
              no_of_unit_inspected: row[17],
              target_pest_common_name: row[18],
              target_pest_species_name: row[19],
              target_spp:row[20],
              other: row[21],
              species_identified1: row[22],
              species_identified1_no: row[23],
              species_identified2: row[24],
              species_identified2_no: row[25],
              species_identified3: row[26],
              species_identified3_no: row[27],
              species_identified4: row[28],
              species_identified4_no: row[29],
              species_identified5: row[30],
              species_identified5_no: row[31],
              lims_reference_number: row[32],
              diagnostic_service: row[33],
              date_identified: row[34],
              comments: row[35]
            )     

          
          end
        
        end

        index = index + 1
     end
    end
  
end
