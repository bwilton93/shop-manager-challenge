require_relative './order'
require_relative './item'

class OrderRepo
  def all
    orders = []

    sql = 'SELECT * FROM orders;'

    results = DatabaseConnection.exec_params(sql, [])

    results.each do |result|
      orders << new_order(result)
    end

    return orders
  end

  def create_order(order)
    params = [order.customer_name, order.order_date]

    sql = "INSERT INTO orders (customer_name, order_date) VALUES ($1, $2);"

    DatabaseConnection.exec_params(sql, params)
  end

  def fetch_items(order_id)
    items = []
    params = [order_id]
    
    sql = 'SELECT * FROM items
            JOIN items_orders_join ON items_orders_join.item_id = items.id
            JOIN orders ON items_orders_join.order_id = orders.id
              WHERE orders.id = $1'
  
    results = DatabaseConnection.exec_params(sql,params)

    results.each do |result|
      item = Item.new

      item.name = result['name']
      item.unit_price = result['unit_price']
      item.quantity = result['quantity']

      items << item
    end

    return items
  end

  def add_item_to_order(order_id, item_id)

  end

  private 

  def new_order(result)
    order = Order.new
  
    order.id = result['id']
    order.customer_name = result['customer_name']
    order.order_date = result['order_date']
    order.items = fetch_items(order.id)

    return order
  end
end
