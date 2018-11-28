class CreateExpoMap < ActiveRecord::Migration[5.0]
  def change
    create_table :expo_maps do |t|
      t.string :image, null: '', unique: true

      t.timestamps
    end

  end
end