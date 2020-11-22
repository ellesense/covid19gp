class AddAttrToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pnw, :boolean
    add_column :users, :hit, :boolean
    add_column :users, :gpn, :boolean
    add_column :users, :member, :boolean
  end
end
