require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initialize 
        super('questions.db')
        self.type_translation = true # ask TA
        self.results_as_hash = true
    end
end

class User
    attr_accessor :fname, :lname, :id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(" SELECT * FROM users WHERE id = '#{id}' ")
        data.nil? ? nil :  User.new(data.first) 
        # data.map { |datum| User.new(datum) }
    end

    def self.find_by_name(fname, lname)
        info = {fname: fname, lname: lname}
        data = QuestionsDatabase.instance.execute(<<-SQL, info)
        SELECT
           *
        FROM
            users 
        WHERE 
          users.fname = :fname AND users.lname = :lname  
        SQL
        data.nil? ? nil : User.new(data.first) 
    end 

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end

class Question < SQLite3::Database
    attr_accessor :title, :body, :author_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        question_data.nil? ? nil : Question.new(question_data)
    end

    def self.find(id)
        question_data = QuestionsDatabase.instance.execute(" SELECT * FROM questions WHERE question_id = '#{id}' ")
        question_data.nil? ? nil : Question.new(question_data)
    end

    def self.find_by_author_id(author_id)
        question_data = QuestionsDatabase.instance.execute(" SELECT * FROM questions WHERE question_id = '#{author_id}' ")
        question_data.nil? ? nil : Question.new(question_data) 
    end


end 