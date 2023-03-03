class Product < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_one_attached :photo
  has_many :bookings, dependent: :destroy

  def avaible
    product = self
    is_valid = true
    if product.bookings.present?
      bookings = Booking.where(product_id: product.id)
      bookings.reject do |booking|
        booking.date.nil? || booking.end_date < Date.today || booking.date > Date.today
      end
      is_valid = bookings.length < 1
    end
    return is_valid
  end
end
