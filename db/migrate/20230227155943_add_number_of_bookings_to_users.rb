class AddNumberOfBookingsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :number_of_bookings, :integer
  end
end
