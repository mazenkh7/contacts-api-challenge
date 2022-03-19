class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :lname
      t.string :number
      t.string :email

      t.timestamps
    end
  end
end
