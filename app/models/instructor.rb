class Instructor
    attr_reader :name
    
    @@all = [] 
    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def tests
        BoatingTest.all.select {|test| test.instructor == self}
    end 

    def passed_students 
        passed = tests.select {|test| test.status == "passed"}
        passed.map {|x| x.student}
    end 

    def pass_student(student, boating_test)
        student_instance = tests.select {|test| test.student == student}
        student_test = student_instance.find {|test| test.name == boating_test}
        if student_test 
            student_test.status = "passed"
            student_test
        else         
            BoatingTest.new(student, boating_test, self, status = "passed")
        end
    end

    def failed_students 
        passed = tests.select {|test| test.status == "failed"}
        passed.map {|x| x.student}
    end 

    def all_students(name)
        final = tests.select {|test| test.name == name}
        final.map {|x| x.student}
    end 
end
