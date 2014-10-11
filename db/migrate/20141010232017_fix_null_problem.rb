class FixNullProblem < ActiveRecord::Migration
  def change
    change_column :newsletters, :date, :datetime, :null => true
  end
end
