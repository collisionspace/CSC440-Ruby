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
  employees.each { |x| dept_nums << x.dept}
  dept_nums.uniq.each { |x| puts x}

  i = 0
  e = 0
  while true
    while employees[e].dept == dept_nums[i] do
      file.outputLine(employees[e])
      e += 1
    end
    dept = employees.select { |m| m.dept ==  dept_nums[i] }
    b = dept.map(&:count).inject(0, :+)
    puts b
    i += 1
    if e == 12 then break end
  end

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