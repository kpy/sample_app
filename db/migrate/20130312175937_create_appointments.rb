class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :starttime
      t.datetime :endtime
      t.string :title
      t.string :place
      t.string :description
      t.integer :owner_id
      t.boolean :ispublic, default: false
      
      t.timestamps
    end
  end
end
