class EmailSentColumns < ActiveRecord::Migration
  def change
    change_table :newsletters do |t|
      t.boolean :email_sent, default: false
    end

    change_table :peek_and_vocabs do |t|
      t.boolean :email_sent, default: false
    end
  end
end
