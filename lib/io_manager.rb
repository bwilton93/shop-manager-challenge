require_relative './function_repo'
require_relative './item_repo'
require_relative './order_repo'
require_relative './item'
require_relative './order'

class IOManager
  def initialize(io)
    @io = io
    @function_repo = FunctionRepo.new
    @item_repo = ItemRepo.new
    @order_repo = OrderRepo.new
  end

  def run
    greeter
    list_options
    case_handler(input)
  end

  private 

  def input
    return @io.gets.chomp
  end

  def case_handler(input)
    new_line
    case input
    when "1"
      list_items
    when "2"
      create_item
    when "3"
      list_orders
    when "4"
      create_order 
    else
      exit
    end
  end
  
  def greeter
    @io.puts "Welcome to the shop management program."
    new_line
  end

  def list_options
    @io.puts "What do you want to do?"
    functions = @function_repo.all
    functions.each do |function|
      @io.puts "#{function.id} = #{function.function}"
    end
    new_line
  end

  def list_items
    @io.puts "Here's a list of all shop items:"
    new_line
    items = @item_repo.all
    items.each do |item|
      @io.puts "#{item.id}. #{item.name} - Unit price: #{item.unit_price} - Quantity: #{item.quantity}"
    end
    new_line
  end

  def create_item

  end

  def list_orders

  end

  def create_order
    @io.print "Enter customer name: "
    customer_name = input
    
    order = Order.new
    order.customer_name = customer_name
    order.order_date = Date.today
    @order_repo.create_order(order)
    new_line
  end

  def new_line
    @io.puts ""
  end
end
