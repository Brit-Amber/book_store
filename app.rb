# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/book_repository.rb'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

nick_books = BookRepository.new
puts nick_books.all
puts nick_books.print_booklist #This is printing the array from .all too. 
