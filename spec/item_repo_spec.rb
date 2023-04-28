require 'item_repo'

def reset_tables
  seeds = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager' })
  connection.exec(seeds)
end

RSpec.describe ItemRepo do
  before(:each) do
    reset_tables
  end

  it "returns a list of all items in the items table" do
    repo = ItemRepo.new

    items = repo.all
    expect(items.length).to eq 4
    expect(items.first.name).to eq 'Star Wars Jedi: Survivor'
    expect(items.first.unit_price).to eq '60'
    expect(items.first.quantity).to eq '420'

    expect(items.last.name).to eq 'Metroid Prime'
    expect(items.last.unit_price).to eq '3'
    expect(items.last.quantity).to eq '12'
  end

  it "can create a new item and add it to the items table" do

  end
end