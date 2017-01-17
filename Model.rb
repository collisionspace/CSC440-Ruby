require "./Employee"
require "./FileIO"

class Model
  private_class_method :new
  @@obj = nil
  def Model.create
    @@obj = new unless @@obj
    @@obj
  end

  def hello
    puts "hello"
  end

end