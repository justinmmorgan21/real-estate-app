class RemoveFloorsFromHomes < ActiveRecord::Migration[7.1]
  def change
    remove_column :homes, :floors, :integer
  end
end
