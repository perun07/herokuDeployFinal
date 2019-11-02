class CreateSearchActives < ActiveRecord::Migration[6.0]
  def change
    create_table :search_actives do |t|
      t.string :raceType
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
