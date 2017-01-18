require "./Employee"
require "./FileIO"
require "./Array"

class Widgets
  puts "hello"
  # puts File.read("widgets.csv")

  file = FileIO.new()
  employees = file.readData

  #sorts by name a - z
  # sortE = employees.sort { |x,y| x.name.downcase <=> y.name.downcase }
  # puts sortE[0].name
  # sortE2 = employees.sort_by { |x| x.name.downcase }
  # puts sortE2[0].name
  #employees = employees.sort_by { |x| x.state }
  dept_nums = []
  dept_plants = []
  employees.each { |x| dept_nums << x.dept}
  dept_nums = dept_nums.uniq

  employees.each { |x| dept_plants << x.plant}
  puts employees.select { |m| m.plant ==  dept_plants[0] }.count

  index = 0
  dept_nums.each { |deptn|
    #selects employees of said dept num
    dept_employees = employees.select { |m| m.dept ==  deptn }
    #outputs those employees
    dept_employees.each { |employee|
      file.outputLine(employee)
    }
    #adds the count
    b = dept_employees.map(&:count).inject(0, :+)
    puts b
    index += 1
  }

  employees.each do |x|
    puts x.dept
  end


  dept_nums = []
  employees.each { |x| dept_nums << x.dept}

  dept_nums.uniq.each { |x| puts x}

  dept = employees.select { |m| m.dept == "56" }
  dept.each { |x| puts "dept = #{x.name}" }
  employees.each { |x| puts "name = #{x.name}" }

  file.outputLine(dept[0])
  #grabs all the states that are 12
  x = 4
  employees.test_cl { x += 1}
  puts x
#  employees.filter{|inner| 1 += inner }
  est = employees.select { |m| m.state == "12" } #employees.select do |x| x.state == 12  end#find_all { |x| x.state = 12 }
  est.each { |x| puts x.state }
end