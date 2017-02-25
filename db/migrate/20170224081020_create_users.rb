class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :password_digest
      t.text :region
      t.text :mailadd

      t.timestamps
    end
  end
end