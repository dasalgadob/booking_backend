class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :movie, foreign_key: true
      t.integer :id_card
      t.string :email
      t.string :name
      t.integer :phone
      t.date :booking_date

      t.timestamps
    end
  end
end
