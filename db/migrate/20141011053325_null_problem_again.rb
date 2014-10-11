class NullProblemAgain < ActiveRecord::Migration
  def change
    # Couldn't change the columns that Paperclip had
    # generated with null: false
    # Dropping and recreating table
    drop_table :newsletters
  end
end