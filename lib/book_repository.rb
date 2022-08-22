require_relative './book.rb'
class BookRepository
    def initialize (io = Kernel)
        @io = io
        @books = []
    end

    def all
        request = 'SELECT id, title, author_name FROM books;'
        result = DatabaseConnection.exec_params(request, [])

        result.each do |story|
            book = Book.new
            book.id = story['id']
            book.title = story['title']
            book.author_name = story['author_name']

            books << book
        end

        return books
    end

    def book_list
        #books = [<book1>, <book2>, <book3>]
        books.each do |story|
            @io.puts "#{story.id} - #{story.title} - #{story.author_name}"
        end
    end

end

#   "#{book.id} - #{book.title} - #{book.author_name}"

#   # In the project directory book_store

# $ ruby app.rb

# 1 - Nineteen Eighty-Four - George Orwell
# 2 - Mrs Dalloway - Virginia Woolf
# 3 - Emma - Jane Austen
# 4 - Dracula - Bram Stoker
# 5 - The Age of Innocence - Edith Wharton