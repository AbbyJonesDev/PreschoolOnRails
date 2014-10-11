class NullProblem < ActiveRecord::Migration
  def change
    # This didn't work, because Paperclip had added second
    # columns for each of these with the null: false value
    change_column :newsletters, :file_file_name, :string, :null => true
    change_column :newsletters, :file_content_type, :string, :null => true
    change_column :newsletters, :file_file_size, :string, :null => true
    change_column :newsletters, :file_updated_at, :string, :null => true
  end
end