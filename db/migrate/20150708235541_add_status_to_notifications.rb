class AddStatusToNotifications < ActiveRecord::Migration
  def change
  	add_column :notifications, :status, :string, default: "new"
  end
end
