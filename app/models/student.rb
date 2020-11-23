class Student
    attr_reader :first_name

    @@all = [] 
    def initialize(first_name)
        @first_name = first_name 
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def add_boating_test(boating_test, status, instructor)
        BoatingTest.new(self, boating_test, status, instructor)
    end 

    def tests 
        BoatingTest.all.select {|test| test.student == self}
    end 

    def all_instructors 
        tests.map {|test| test.instructor}.uniq
    end 

    def self.find_student(first_name)
        Student.all.find {|student| student.first_name == first_name}
    end 

    def grade_percentage
        test_count = tests.count.to_f
        pass_count = tests.select {|test| test.status == "passed"}.count.to_f
        passed = (pass_count / test_count)*100
        passed
    end 

end
