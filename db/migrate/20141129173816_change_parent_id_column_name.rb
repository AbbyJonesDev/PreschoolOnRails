class ChangeParentIdColumnName < ActiveRecord::Migration
  def change
    rename_column :class_parents, :parent_id, :user_id
  end
end
