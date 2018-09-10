class CreateSensorData < ActiveRecord::Migration[5.2]
  def change
    create_table :sensor_data do |t|
      t.float :temperature
      t.float :humidity
    end
  end
end
