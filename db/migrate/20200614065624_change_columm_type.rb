class ChangeColummType < ActiveRecord::Migration[6.0]
  def change
    change_column :locations, :user_id, :string
    change_column :locations, :access_id, :string
    change_column :locations, :address_id, :string
  end
end
