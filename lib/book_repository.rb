require_relative './book.rb'

class BookRepository
    def initialize(io = Kernel)
        @io = io
    end

    def all
        request = 'SELECT id, title, author_name FROM books;'
        result = DatabaseConnection.exec_params(request, [])

        books = []

        result.each do |story|
            book = Book.new

            book.id = story['id']
            book.title = story['title']
            book.author_name = story['author_name']

            books << book

        end

        return books
    end
        
    def print_booklist
        all.each do |story|
            @io.puts "#{story.id} - #{story.title} - #{story.author_name}"
        end
        #Puts of string of id - title - author_name
    end

end