class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
#      t.string :adress
#      t.integer :phone

      t.timestamps
    end
  end
end
