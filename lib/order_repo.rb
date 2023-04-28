require_relative './order'

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
    
  end

  def add_item_to_order(item_id)

  end

  private 

  def new_order(result)
    order = Order.new
  
    order.id = result['id']
    order.customer_name = result['customer_name']
    order.order_date = result['order_date']
    
    return order
  end
end
