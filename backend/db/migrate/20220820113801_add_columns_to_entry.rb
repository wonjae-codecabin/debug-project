class AddColumnsToEntry < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :corrective_action_msg, :string
    add_column :entries, :corrective_action_date, :string
    add_column :entries, :corrective_action_image, :string
  end
end
