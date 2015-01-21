class CreatePeekAndVocabs < ActiveRecord::Migration
  def change
    create_table :peek_and_vocabs do |t|
      t.date :date
      t.attachment :file
      t.timestamps
    end
  end
end