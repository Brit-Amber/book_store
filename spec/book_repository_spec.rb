require "book_repository"
RSpec.describe BookRepository do

    def reset_books_table
        seed_sql = File.read('spec/seeds_books.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
        connection.exec(seed_sql)
    end
  
    before(:each) do 
      reset_books_table
    end
  
    describe "#all" do
        it 'Accesses DB and creates array of objects of books' do
            repo = BookRepository.new

            books = repo.all

            expect(books.length).to eq 2

            expect(books[0].id).to eq "1"
            expect(books[0].title).to eq 'To Kill a Mockingbird'
            expect(books[0].author_name).to eq 'Harper Lee'

            expect(books[1].id).to eq "2"
            expect(books[1].title).to eq 'War and Peace'
            expect(books[1].author_name).to eq 'Leo Tolstoy'
        end
    end

    describe "#print_booklist" do
        it '' do
            repo = BookRepository.new
            expect(repo.print_booklist).to eq ["1 - To Kill a Mockingbird - Harper Lee", "2 - War and Peace - Leo Tolstoy"] 
        end
    end

end