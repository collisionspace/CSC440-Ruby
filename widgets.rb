require "./Employee"
require "./FileIO"

class Widgets
  puts "hello"
  # puts File.read("widgets.csv")

  file = FileIO.new()
  employees = file.readData
  puts employees[1].name
  # File.open("widgets.csv", "r") do |f|
  #   f.each_line do |line|
  #     splitLine = line.split(',')
  #     puts splitLine[0]
  #     em = Employee.new(splitLine[0], splitLine[1], splitLine[2], splitLine[3], splitLine[4], splitLine[5])
  #   end
  # end
end