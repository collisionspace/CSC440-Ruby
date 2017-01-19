require "./Employee"
require "./FileIO"
require "./Array"

class Widgets
  puts "hello"
  # puts File.read("widgets.csv")

  file = FileIO.new()
  employees = file.readData

  dept_nums = []
  dept_state = []
  employees.each { |x| dept_nums << x.dept }
  dept_nums = dept_nums.uniq


  employees.each { |x| dept_state << x.state }
  dept_state = dept_state.uniq

  dept_state.each { |state|
    #all 12's
    employees_state = employees.select { |employee| employee.state == state }

    dept_plants = []
    employees_state.each { |x| dept_plants << x.plant }
    employees_state_plant = dept_plants.uniq

    employees_state_plant.each { |plant_num|
      employees_plant =  employees.select { |employee| employee.plant == plant_num }
      employees_dept = []
      employees_plant.each { |x| employees_dept << x.dept }
      employee_dept_uni = employees_dept.uniq

      employee_dept_uni.each { |dept|
        employees_dept =  employees.select { |employee| employee.dept == dept }
        employees_dept.each { |x| puts x.name }
        puts dept
      }
      puts plant_num
    }
    puts state
  }
end