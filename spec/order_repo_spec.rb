require 'order_repo'

RSpec.describe OrderRepo do
  before(:each) do
    reset_tables
  end

  it "returns a list of all orders with correct related items" do
    repo = OrderRepo.new

    orders = repo.all

    expect(orders.length).to eq 3
    expect(orders.first.customer_name).to eq 'Barney'
    expect(orders.first.order_date).to eq '2023-01-01'
    
    expect(orders.last.customer_name).to eq 'Michael'
    expect(orders.last.order_date).to eq '2023-04-28'
  end

  it "can create a new order" do
    repo = OrderRepo.new

    order = double :order, customer_name: 'fake_name', order_date: '2023-04-28'

    repo.create_order(order)
    orders = repo.all

    expect(orders.length).to eq 4
  end
end
