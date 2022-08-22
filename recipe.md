1. Design and create the table
# EXAMPLE

Table: books

Columns:
id | title | author_name

2. Create Test SQL seeds

```sql
-- EXAMPLE
-- (file: spec/seeds_books.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE books RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO books (title, author_name) VALUES ('Nineteen Eight-Four', 'George Orwell');
INSERT INTO books (title, author_name) VALUES ('Mrs Dalloway', 'Virginia Woolf');


```
3. Define the class names
```ruby
# EXAMPLE
# Table name: books

# Model class
# (in lib/book.rb)
class Book
end

# Repository class
# (in lib/book_repository.rb)
class BookRepository
end
```

4. Implement the Model class
```ruby
# EXAMPLE
# Table name: Book

# Model class
# (in lib/book.rb)

class Book

  # Replace the attributes by your own columns.
  attr_accessor :id, :title, :author_name
end


```
5. Define the repository class interface
```ruby
# EXAMPLE
# Table name: books

# Repository class
# (in lib/book_repository.rb)

class BookRepository

  # Selecting all books
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, author_name FROM books;

    # Returns an array of Book objects.
  end

  def book_list
    #return a list of strings with the id, book name, and author name
  end
end
```
6. Write test examples
```ruby
# EXAMPLES

# 1
# Get all books

repo = BookRepository.new

books = repo.all

books.length # =>  2

books[0].id # =>  1
books[0].title # =>  'Nineteen Eight-Four',
books[0].author_name # =>  'George Orwell'

books[1].id # =>  2
books[1].title # =>  'Mrs Dalloway'
books[1].author_name # =>  'Virginia Woolf'

# 2
# Print a list of all books

repo = BookRepository.new

books.book_list # => "1 - Nineteen Eight-Four - George Orwell\n2 - Mrs Dalloway - Virginia Woolf"


7. Reload the SQL seeds before each test run

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'books' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_books_table
  end

  # (your tests will go here).
end
```
8. Test-drive and implement the repository class behaviour
