class CreatePasswords < ActiveRecord::Migration[5.2]
  def change
    create_table :passwords do |t|
      t.string :url
      t.string :email
      t.string :pwd

      t.timestamps
    end
  end
end
