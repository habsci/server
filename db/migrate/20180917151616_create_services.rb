class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :on_duration
      t.integer :off_duration

      t.timestamps
    end
  end
end
