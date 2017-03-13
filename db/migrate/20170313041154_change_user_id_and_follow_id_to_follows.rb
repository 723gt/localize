class ChangeUserIdAndFollowIdToFollows < ActiveRecord::Migration[5.0]
  def up
    change_column :follows,:user_id,:text
    change_column :follows,:follow_id,:text
  end
end
