require 'date'

class Student
  attr_accessor :surname, :name, :date_of_birth

  @@students = []

  def initialize(surname, name, date_of_birth)

    raise ArgumentError, "Date of birth must be in past" if Date.parse(date_of_birth) > Date.today

    @surname = surname
    @name = name
    @date_of_birth = Date.parse(date_of_birth)

    add_student

  end

  def calculate_age()
    today = Date.today
    age = today.year - @date_of_birth.year
    age -= 1 if @date_of_birth.month > today.month || (today.month == today.month && today.day >= today.day)
    age
  end

  def add_student
    unless @@students.any? { |student| student.surname == @surname && student.name == @name && student.date_of_birth == @date_of_birth }
      @@students << self
    else
      puts "#{@surname} student is already on the list"
    end
  end

  def self.remove_student!()
    @@students.delete(self)
  end

  def self.get_students_by_age(age)
    @@students.select { |student| student.date_of_birth > age }
  end

  def self.get_students_by_name(name)
    @@students.select { |student| student.name == name }
  end
end