require 'csv'
Order.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'memory-tech-challenge-data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.first(800).each do |row|
  t = Order.new
  t.date = row['date']
  t.order_id = row['order_id']
  t.customer_id = row['customer_id']
  t.country = row['country']
  t.product_code = row['product_code']
  t.product_description = row['product_description']
  t.quantity = row['quantity']
  t.unit_price = row['unit_price']
  t.save
  puts "#{t.product_code} saved"
end

puts "There are now #{Order.count} rows in the orders table"
