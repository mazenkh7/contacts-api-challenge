class CreateEdits < ActiveRecord::Migration[7.0]
  def change
    create_table :edits do |t|
      t.integer :contactid
      t.string :fname
      t.string :lname
      t.string :number
      t.string :email

      t.timestamps
    end
  end
end
