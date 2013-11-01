class CreateNameCards < ActiveRecord::Migration
  def change
    create_table :name_cards do |t|
      t.string :name
      t.string :address
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
