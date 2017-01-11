class Employee
  # constructor method
  #STATE,PLANT,DEPT,EMPID,NAME,COUNT
  attr_accessor :state, :dept, :name, :count, :plant, :empid

  def initialize(st, plant, dept, empid, name, count)
    @state, @plant, @dept, @empid, @name, @count = st, plant, dept, empid, name, count
  end
end