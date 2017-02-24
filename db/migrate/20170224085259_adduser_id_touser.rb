class AdduserIdTouser < ActiveRecord::Migration[5.0]
  def change
    add_column :users,:user_id,:text
  end
end
