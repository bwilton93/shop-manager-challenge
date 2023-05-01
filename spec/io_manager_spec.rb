require 'io_manager'

RSpec.describe IOManager do
  it "displays all items" do
    io = double :io
    expect(io).to receive(:puts).with("Welcome to the shop management program.")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:puts).with("What do you want to do?")
    expect(io).to receive(:puts).with("1 = List all items.")
    expect(io).to receive(:puts).with("2 = Create a new item.")
    expect(io).to receive(:puts).with("3 = List all orders.")
    expect(io).to receive(:puts).with("4 = Create a new order.")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:puts).with("Here's a list of all shop items:")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:puts).with("1. Star Wars Jedi: Survivor - Unit price: 60 - Quantity: 420")
    expect(io).to receive(:puts).with("2. The Legend of Zelda: The Wind Waker - Unit price: 69 - Quantity: 14")
    expect(io).to receive(:puts).with("3. Dead Space - Unit price: 42 - Quantity: 69")
    expect(io).to receive(:puts).with("4. Metroid Prime - Unit price: 3 - Quantity: 12")
    expect(io).to receive(:puts).with("")
    
    io_manager = IOManager.new(io)
    io_manager.run
  end
end
