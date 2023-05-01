require 'io_manager'

RSpec.describe IOManager do
  it "returns the correct message flow" do
    io = double :io
    expect(io).to receive(:puts).with("Welcome to the shop management program.")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:puts).with("What do you want to do?")
    expect(io).to receive(:puts).with("1 = List all items.")
    expect(io).to receive(:puts).with("2 = Create a new item.")
    expect(io).to receive(:puts).with("3 = List all orders.")
    expect(io).to receive(:puts).with("4 = Create a new order.")

    io_manager = IOManager.new(io)
    io_manager.run
  end
end
