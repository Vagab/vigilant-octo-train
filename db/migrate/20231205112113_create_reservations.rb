class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.decimal :price, precision: 10, scale: 2
      t.datetime :external_created_at
      t.string :external_id
      t.string :status

      t.timestamps
    end
  end
end
