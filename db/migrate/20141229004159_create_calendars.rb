class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :title
      t.boolean :current
      t.attachment :calendar_file

      t.timestamps
    end
  end
end
