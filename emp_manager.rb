
#Updated with this comment
class Employee
  attr_reader :name, :salary, :title
  attr_accessor :boss
  def initialize(name, title, salary, boss = nil)
    @name = name
    @salary = salary
    @title = title
    self.boss = @boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_subordinate(self) unless boss.nil?
    boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def add_subordinate(emp)
    @employees << emp
    emp
  end

  def bonus(multiplier)
    self.total_subsalary * multiplier
  end

  def total_subsalary
    sal = 0
    self.employees.each do |emp|
      if emp.is_a?(Manager)
        sal += emp.salary + emp.total_subsalary
      else
        sal += emp.salary
      end
    end
    sal
  end
end


ned = Employee.new("Ned", "Boss", 1_000_000, nil)
darren = Employee.new("Darren", "Manager", 78_000, "Ned")
shawna = Employee.new("Shawna", "TA", 12_000, "Darren")
david = Employee.new("David", "TA", 10_000, "Darren")
