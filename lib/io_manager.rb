require_relative './function_repo'
require_relative './item_repo'
require_relative './order_repo'

class IOManager
  def initialize(io)
    @io = io
    @function_repo = FunctionRepo.new
  end

  def run
    greeter
    list_options
  end
  
  def greeter
    @io.puts "Welcome to the shop management program."
    @io.puts ""
  end
  
  def list_options
    @io.puts "What do you want to do?"
    functions = @function_repo.all
    functions.each do |function|
      @io.puts "#{function.id} = #{function.function}"
    end
  end
end
