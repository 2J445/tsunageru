class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :telephone_number
      t.string :furiganaName
      t.string :address
      t.string :self_inroduction
      t.string :image

      t.timestamps
    end
  end
end
