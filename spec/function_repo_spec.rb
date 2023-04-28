require 'function_repo'

def reset_tables
  seeds = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager' })
  connection.exec(seeds)
end

RSpec.describe FunctionRepo do
  before(:each) do
    reset_tables
  end

  it "returns a full list of all functions from shop_functions table" do
    repo = FunctionRepo.new

    functions = repo.all
    expect(functions.length).to eq 4
    expect(functions.first.function).to eq 'List all items'
    expect(functions.last.function).to eq 'Create a new order'
  end
end
