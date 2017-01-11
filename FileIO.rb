require "./Employee"

class FileIO
  def readData
    employees = []
    File.open("widgets.csv", "r") do |f|
      f.each_line do |line|
        splitLine = line.split(',')
        puts splitLine[0]
        employees.push(Employee.new(splitLine[0], splitLine[1], splitLine[2], splitLine[3], splitLine[4], splitLine[5]))
      end
    end
    return employees
  end
end