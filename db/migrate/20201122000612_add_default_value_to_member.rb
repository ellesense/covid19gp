class AddDefaultValueToMember < ActiveRecord::Migration[6.0]
  def up
    change_column_default :users, :member, false
  end

  def down
      change_column_default :users, :member, nil
  end
end
