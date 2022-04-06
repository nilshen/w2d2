require "employee"

class Startup
    attr_reader(:name, :funding,:salaries, :employees)
    def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
    end

    def valid_title?(title)
        if salaries.has_key?(title)
            return true
        end 
    false
    end 
            
    def >(other_starup)
        if self.funding > other_starup.funding
            return true
        end
    false
    end

    def hire (employee_name, title)
        if self.salaries.has_key?(title)
        employee_name = Employee.new(employee_name, title)
        employees << employee_name
        else raise "Who's this?"
        end
    end 

    def size 
        return employees.length
    end

    def pay_employee(employee)
        money_to_pay = @salaries[employee.title]
        if @funding >= money_to_pay
            employee.pay(money_to_pay)
            @funding -= money_to_pay
        else raise "no money!!!!!"
        end
    end 

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end
end


