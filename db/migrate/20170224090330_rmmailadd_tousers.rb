class RmmailaddTousers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users,:mailadd,:text
  end
end
