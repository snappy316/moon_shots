class CreateSatellites < ActiveRecord::Migration[5.2]
  def change
    create_table :satellites do |t|
      t.datetime :last_telemetry_timestamp

      t.timestamps
    end
  end
end
