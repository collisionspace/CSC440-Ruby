require './Employee'

class FileIO
  def read_data
    employees = []
    File.open('widgets.csv', 'r') do |f|
      f.each_line do |line|
        splitLine = line.split(',')
        if splitLine[4] != 'NAME'
          employees.push(Employee.new(splitLine[0], splitLine[1], splitLine[2], splitLine[3], splitLine[4], splitLine[5].gsub("\n",'').to_i))
        end
      end
    end
    employees
  end

  def output_employee(employee)
    printf "\n%4s %4s %5s %5s %6s %s", employee.state, employee.plant, employee.dept, employee.empid, employee.count, employee.name
  end
end