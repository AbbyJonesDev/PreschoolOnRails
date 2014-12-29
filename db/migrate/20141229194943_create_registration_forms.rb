class CreateRegistrationForms < ActiveRecord::Migration
  def change
    create_table :registration_forms do |t|
      t.string :title
      t.attachment :file
      t.boolean :current

      t.timestamps
    end
  end
end
