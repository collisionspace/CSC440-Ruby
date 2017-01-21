require './Employee'
require './FileIO'

class Widgets
  #initialize the FileIO and read in the data from the csv
  file = FileIO.new()
  employees = file.read_data

  #get all the employees state
  #then filter the state arrays to get all the unique ints
  dept_state = []
  employees.each { |x| dept_state << x.state }
  employee_state = dept_state.uniq

  #outputs the headers for the output
  puts 'STATE PLANT DEPT EMPID COUNT NAME'
  #states
  employee_state.each { |state|

    #get all the employees within that state
    employees_state = employees.select { |employee| employee.state == state }

    #get all the employees plants within that said state
    #then filter the plant arrays to get all the unique ints
    dept_plants = []
    employees_state.each { |x| dept_plants << x.plant }
    employees_plant_uni = dept_plants.uniq

    #plant
    employees_plant_uni.each { |plant_num|

      #get all the employees within that plant
      employees_plant =  employees.select { |employee| employee.plant == plant_num }

      #get all the employees depts within that said plant
      #then filter the dept arrays to get all the unique ints
      employees_dept = []
      employees_plant.each { |x| employees_dept << x.dept }
      employee_dept_uni = employees_dept.uniq


      #dept
      employee_dept_uni.each { |dept|

        #get all the employees within that said dept
        #then loops on that array and outputs the formatted line with the employee info
        employees_dept =  employees_plant.select { |employee| employee.dept == dept }
        employees_dept.each { |x| file.output_employee(x) }

        #outputs the total count for the dept and the said dept num
        printf "\n\n%28s TOTAL FOR DEPT %-3s *\n", employees_dept.map(&:count).inject(0, :+), dept
      }

      #outputs the total count for the plant and the said plant num
      printf "%28s TOTAL FOR PLANT %-2s **\n", employees_plant.map(&:count).inject(0, :+), plant_num
    }

    #outputs the total count for the state and the said state num
    printf "%28s TOTAL FOR STATE %s ***\n", employees_state.map(&:count).inject(0, :+), state
  }

  #outputs the grand total count
  printf "\n%28s GRAND TOTAL \t\t****\n", employees.map(&:count).inject(0, :+)
end