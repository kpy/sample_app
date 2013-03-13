class AddIspublicToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :ispublic, :boolean, default: false
  end
end
