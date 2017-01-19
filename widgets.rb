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
  employee_state = dept_state.uniq

  #states
  employee_state.each { |state|
    employees_state = employees.select { |employee| employee.state == state }
    dept_plants = []
    employees_state.each { |x| dept_plants << x.plant }
    employees_state_plant = dept_plants.uniq

    #plant
    employees_state_plant.each { |plant_num|
      employees_plant =  employees.select { |employee| employee.plant == plant_num }
      employees_dept = []
      employees_plant.each { |x| employees_dept << x.dept }
      employee_dept_uni = employees_dept.uniq

      #dept
      employee_dept_uni.each { |dept|
        employees_dept =  employees.select { |employee| employee.dept == dept }
        employees_dept.each { |x| file.outputEmployee(x) }
        printf "\n%14s TOTAL FOR DEPT %-3s *\n", employees_dept.map(&:count).inject(0, :+), dept
      }
      printf "%14s TOTAL FOR PLANT %-2s **\n", employees_plant.map(&:count).inject(0, :+), plant_num
    }
    printf "%14s TOTAL FOR STATE %s ***\n", employees_state.map(&:count).inject(0, :+), state
    printf "%14s GRAND TOTAL \t\t****\n", employees.map(&:count).inject(0, :+), state
  }
end