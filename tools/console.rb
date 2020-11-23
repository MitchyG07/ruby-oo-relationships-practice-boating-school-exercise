require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

spongebob.add_boating_test("Don't Crash 101", "pending", puff)
patrick.add_boating_test("Power Steering 202", "failed", puff)
patrick.add_boating_test("Power Steering 201", "passed", krabs)
patrick.add_boating_test("Don't Crash 101", "pending", puff)
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

