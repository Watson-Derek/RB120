class Student
  attr_accessor :name

  def initialize(name, grade)
    self.name = name
    @grade = grade
  end

  def grade_better_than?(student)
    self.grade > student.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new('Joe', 97)
bob = Student.new('Bob', 83)

puts "Well done!" if joe.grade_better_than?(bob)
