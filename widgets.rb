require "./Employee"
require "./FileIO"
require "./Array"

class Widgets
  file = FileIO.new()
  employees = file.readData

  dept_state = []
  employees.each { |x| dept_state << x.state }
  employee_state = dept_state.uniq


  puts 'STATE PLANT DEPT EMPID COUNT NAME'
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
        puts ''
        employees_dept =  employees_plant.select { |employee| employee.dept == dept }
        employees_dept.each { |x| file.outputEmployee(x) }
        printf "\n%28s TOTAL FOR DEPT %-3s *\n", employees_dept.map(&:count).inject(0, :+), dept
      }
      printf "%28s TOTAL FOR PLANT %-2s **\n", employees_plant.map(&:count).inject(0, :+), plant_num
    }
    printf "%28s TOTAL FOR STATE %s ***\n", employees_state.map(&:count).inject(0, :+), state
  }
  printf "\n%28s GRAND TOTAL \t\t****\n", employees.map(&:count).inject(0, :+)
end