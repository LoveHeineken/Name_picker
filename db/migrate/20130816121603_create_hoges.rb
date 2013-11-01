class CreateHoges < ActiveRecord::Migration
  def change
    create_table :hoges do |t|
      t.integer :suuji
      t.string :mojiretsu

      t.timestamps
    end
  end
end
