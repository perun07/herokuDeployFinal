class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :raceName
      t.string :Date
      t.string :Type

      t.timestamps
    end
  end
end
