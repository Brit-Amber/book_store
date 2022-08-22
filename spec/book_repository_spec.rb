require 'book_repository'

RSpec.describe BookRepository do
    def reset_books_table
        seed_sql = File.read('spec/seeds_books.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
        connection.exec(seed_sql)
    end
      
    before(:each) do 
        reset_books_table
    end
    it "returns a list of books" do
    
        repo = BookRepository.new
        books = repo.all

        expect(books.length).to eq 2
        expect(books[0].id).to eq '1'
        expect(books[0].title).to eq 'Nineteen Eight-Four'
        expect(books[0].author_name).to eq 'George Orwell'
        
        expect(books[1].id).to eq "2"
        expect(books[1].title).to eq 'Mrs Dalloway'
        expect(books[1].author_name).to eq 'Virginia Woolf'
    end

    describe "#book_list" do
        it '' do
            io = double(:io)
            expect(io).to receive(:puts).with("1 - Nineteen Eight-Four - George Orwell\n")
            expect(io).to receive(:puts).with("2 - Mrs Dalloway - Virginia Woolf\n")
            repo = BookRepository.new(io)
            books = repo.all
            books.book_list 
        end
    end

end
