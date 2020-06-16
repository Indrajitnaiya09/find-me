class CreateAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :accesses, id: :uuid do |t|
      t.string :share_type

      t.timestamps
    end
  end
end
