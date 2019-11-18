class Order < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_date_country_quantity_unit_price,
    against: [ :date, :country, :quantity, :unit_price ],
    using: {
      tsearch: { prefix: true }
    }
end
