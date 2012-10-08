require 'set'
require 'date'

class TransactionsGenerator
  def generate
    phone = by_description("Zen Full Touch Dual Sim Phone - M28")
    sdcard = by_description("Sandisk 32 GB Micro SD Ultra Card (Class 10)")
    s3 = by_description("Samsung Galaxy S3 i9300 Mobile Phone - 16GB")
    linen_kurta = by_description("Fab India Linen Kurta")
    red_kurta = by_description("Fab India Red Kurta")
    bracelet = by_description("Multicoloured Bracelet")
    watch = by_description("Croco Pattern Leather Strap Watch")
    tikkis = by_description("Kebabs & Tikkis - Tarla Dalal")
    kitchen_set = by_description("Kitchen Linen Set")
    biography = by_description("Steve Jobs: The Exclusive Biography")
    ring = by_description("Ring")
    tshirt = by_description("Ring")
    cap = by_description("T shirt")

    customers = users
    customer_frequency_distribution = {1..1 => 0.4, 2..3 => 0.2, 4..5 => 0.1, 6..10 => 0.2}
    order_value_frequency_distribution = {1..500 => { :fraction_customers =>0.4, :basket_mix => [[product(tshirt,1)], [product(cap,1)], [product(ring,1), product(bracelet,1)]]}, 
      501..2000 => { :fraction_customers =>0.3, :basket_mix => [[product(kitchen_set,1)], [product(tikkis,1)], [product(biography,1), product(cap, 1)]]}, 
      2001..4000 => { :fraction_customers =>0.2, :basket_mix => [[product(sdcard,1), product(biography,1)], [product(watch,1), product(kitchen_set,1)], [product(linen_kurta,1), product(bracelet,1)]]}, 
      4001..10000 => { :fraction_customers =>0.1, :basket_mix => [[product(linen_kurta,1), product(tshirt,1), product(watch,1)], [product(red_kurta,1), product(ring,1)], [product(s3, 1)]]}}
    recency_frequency_distribution = { 0..7 => 0.3, 8..30 => 0.5, 31..80 => 0.2}

    num_customers = 100
    customers = customers[0..(num_customers - 1)]

    ids = Set.new(customers)
    transactions = []

    transaction_number = 0
    customer_frequency_distribution.each_pair do |k,v|
      frequency = (v * num_customers).to_i
      frequency.times do |f|
        num_transactions = (rand(k.end - k.begin) + k.begin).to_i
        as_array = ids.to_a
        customer_index = as_array[rand(as_array.length).to_i]
        num_transactions.times do |i|
          transactions << {:id => customer_index, :transaction_id => transaction_number}
          transaction_number += 1
        end
        ids.delete(customer_index)
      end
    end

    ids = Set.new(customers)
    order_value_frequency_distribution.each_pair do |k,v|
      frequency = (v[:fraction_customers] * num_customers).to_i
      frequency.times do |f|
        as_array = ids.to_a
        customer_index = as_array[rand(as_array.length).to_i]
        selected = transactions.select {|t| t[:id] == customer_index}
        selected.each do |t|
          t[:basket] = v[:basket_mix][rand(v[:basket_mix].length)]
          t[:value] = value(t[:basket])
        end
        ids.delete(customer_index)
      end
    end


    start = Date.new(2012, 5, 1)
    stop = Date.new(2012, 8, 1)

    transactions.each do |t|
      t[:date] = start + rand((stop - start).to_i)
    end

    ids = Set.new(customers)
    recency_frequency_distribution.each_pair do |k,v|
      frequency = (v * num_customers).to_i
      frequency.times do |f|
        as_array = ids.to_a
        customer_index = as_array[rand(as_array.length).to_i]
        selected = transactions.select {|t| t[:id] == customer_index}

        selected.each do |t|
          next if (stop - t[:date] >= k.begin && stop - t[:date] <= k.end)
          t[:date] = stop - (k.begin + k.end).to_i/2 + rand(4) - 2
        end
        ids.delete(customer_index)
      end
    end

    handle = File.open("#{File.expand_path(File.dirname(__FILE__))}/data/op.csv", "w")
    handle.puts("CustomerID, OrderValue, Date, TransactionID, ProductID, Quantity")

    Spree::Order.delete_all
    Spree::LineItem.delete_all

    save_orders(transactions)
    save_line_items(transactions)
    handle.close
  end

  private
  def product(product, quantity)
    {:product => product, :quantity => quantity}
  end

  def by_description(name)
    product = Spree::Product.find(:first, :conditions => ["name = ?", name])
    variant = product.master
    product[:variant_id] = variant.id
    product[:price] = variant.price
    product
  end

  def users()
    Spree::User.find(:all).map{|user| user.id}
  end

  def value(basket)
    sum = 0
    basket.each {|i| sum += i[:product][:price]}
    sum
  end

  def save_orders(transactions)
    transactions.each do |t|
      order = build_order(t)
      order.save
    end
  end

  def save_line_items(transactions)
    transactions.each do |t|
      t[:basket].each do |mix|
        line_item = build_line_item(t, mix)
        line_item.save
        handle.puts("#{t[:transaction_id]}, #{t[:value]/t[:basket].length}, #{t[:date]}, #{t[:transaction_id]}, #{mix[:product][:id]}, #{mix[:quantity]}")
      end
    end
  end

  def build_order(transaction)
    order = Spree::Order.new
    order.id = transaction[:transaction_id] 
    order.item_total = transaction[:value]
    order.total = transaction[:value]
    order.user_id = transaction[:id] 
    order.payment_total = transaction[:value]
    order.created_at = transaction[:date] 
    order.updated_at = transaction[:date]
    order.state = "complete"
    order
  end

  def build_line_item(transaction, mix)
    line_item = Spree::LineItem.new
    line_item.order_id = transaction[:transaction_id]
    line_item.variant_id = mix[:product][:variant_id] 
    line_item.quantity = mix[:product][:quantity]
    line_item.price = mix[:product][:price]
    line_item.created_at = transaction[:date]
    line_item.updated_at = transaction[:date]
    line_item
  end
end






