require "./Employee"
require "./FileIO"

class Widgets
  puts "hello"
  # puts File.read("widgets.csv")

  file = FileIO.new()
  employees = file.readData
  puts employees[1].name

  sortE = employees.sort { |x,y| x.name.downcase <=> y.name.downcase }
  puts sortE[0].name
  sortE2 = employees.sort_by { |x| x.name.downcase }
  puts sortE2[0].name
  sortID = employees.sort_by { |x| x.state }
  puts sortID[0].name

  est = employees.select { |m| m.state =~ /12/ }#employees.select do |x| x.state == 12  end#find_all { |x| x.state = 12 }
  est.each { |x| puts x.state }
end