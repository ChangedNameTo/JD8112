class CreateExpoSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :expo_settings do |t|
      t.boolean :voting_enabled, default: false
      t.timestamps
    end
  end
end
