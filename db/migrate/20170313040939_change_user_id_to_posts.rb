class ChangeUserIdToPosts < ActiveRecord::Migration[5.0]
  def up
    change_column :posts,:user_id,:text
  end
end
