require 'singleton'
require 'sqlite3'
require 'byebug'

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

    def authored_questions
        Question.find_by_author_id(id)
    end

    def authored_replies
        Reply.find_by_user(id)
    end
end

class Question 
    attr_accessor :title, :body, :author_id, :id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        # data.nil? ? nil : Question.new(data.first)
        data.map { |datum| Question.new(datum)}
    end

    def self.find_by_id(id)
        question_data = QuestionsDatabase.instance.execute(" SELECT * FROM questions WHERE id = '#{id}' ")
        question_data.nil? ? nil : Question.new(question_data.first)
    end

    def self.find_by_author_id(author_id)
        question_data = QuestionsDatabase.instance.execute(" SELECT * FROM questions WHERE author_id = '#{author_id}' ")
        question_data.nil? ? nil : Question.new(question_data.first) 
    end 

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def author
        User.find_by_id(author_id)
    end

    def replies
        Reply.find_by_question_id(id)
    end
end

class QuestionFollow
    attr_accessor :id, :user_id, :question_id    
    
    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            question_follows
        WHERE 
            id = ?
        SQL
        
        # data = QuestionsDatabase.instance.execute(" SELECT * FROM question_follows WHERE id = '#{id}' ")
        data.nil? ? nil : QuestionFollow.new(data.first)
        # data.map { |datum| QuestionFollow.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end


class Reply

    attr_accessor :id, :question_id, :author_id, :parent_reply_id, :body

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(" SELECT * FROM question_follows WHERE id = '#{id}' ")
        # q_data.nil? ? nil : QuestionFollows.new(q_data.first)
        data.map { |datum| Reply.new(datum)}
    end

    def self.find_by_user(id)
        data = QuestionsDatabase.instance.execute(" SELECT * FROM replies WHERE author_id = '#{id}' ")
        # q_data.nil? ? nil : QuestionFollows.new(q_data.first)
        data.map { |datum| Reply.new(datum)}
    end

    def self.find_by_question_id(id)
        data = QuestionsDatabase.instance.execute(" SELECT * FROM replies WHERE question_id = '#{id}' ")
        # q_data.nil? ? nil : QuestionFollows.new(q_data.first)
        data.map { |datum| Reply.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @question_id = ['question_id']
        @parent_reply_id = ['parent_reply_id']
        @author_id = options['author_id']
        @body = options['body']
    end
end

class QuestionLike

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(" SELECT * FROM question_follows WHERE id = '#{id}' ")
        # q_data.nil? ? nil : QuestionFollows.new(q_data.first)
        data.map { |datum| QuestionLike.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @author_id = options['author_id']
    end

        
end

