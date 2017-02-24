class AddemailTousers < ActiveRecord::Migration[5.0]
  def change
    add_column :users,:email,:text
  end
end
