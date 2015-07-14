class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.date       :birthday
      t.string     :country
      t.string     :education
      t.string     :profession
      t.text       :about
      t.string     :access, default: "All Users"
      t.boolean    :email_notification, default: true
      t.references :user

      t.timestamps
    end

    add_index :profiles, :user_id
  end
end