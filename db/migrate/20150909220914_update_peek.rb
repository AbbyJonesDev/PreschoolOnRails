class UpdatePeek < ActiveRecord::Migration
  def change
    change_table :peek_and_vocabs do |t|
      t.attachment :vocab
      t.rename :file_file_name, :peek_file_name
      t.rename :file_content_type, :peek_content_type
      t.rename :file_file_size, :peek_file_size
      t.rename :file_updated_at, :peek_updated_at
    end
  end
end
