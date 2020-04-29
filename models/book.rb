require_relative("../db/sql_runner")
require_relative("cash")

class Book

    attr_accessor :title, :author_id, :publisher_id, :description, :genre
    attr_accessor :buy_cost, :sell_price, :stock_count, :copies_sold
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @title = options["title"]
        @author_id = options["author_id"].to_i
        @publisher_id = options["publisher_id"].to_i
        @description = options["description"]
        @genre = options["genre"]
        @buy_cost = options["buy_cost"].to_i
        @sell_price = options["sell_price"].to_i
        @stock_count = options["stock_count"].to_i
        options["copies_sold"] ? @copies_sold = options["copies_sold"].to_i : @copies_sold = 0
    end

    def author()
        return Author.find(@author_id)
    end

    def publisher()
        return Publisher.find(@publisher_id)
    end

    def buy_from_publisher(copies)
        if (copies > 0)
            @stock_count += copies
            update()
        end
    end

    def enough_stock?(copies)
        return @stock_count >= copies
    end

    def sell_to_customer(copies)
        if (copies > 0 && enough_stock?(copies))
            @stock_count -= copies
            @copies_sold += copies
            update()
        end
    end

    def print_buy_cost()
        return Cash.in_pounds(@buy_cost)
    end

    def print_sell_price()
        return Cash.in_pounds(@sell_price)
    end

    def print_markup()
        return Cash.in_pounds(@sell_price - @buy_cost)
    end

    def stock_status()
        return "green" if @stock_count >= 10
        return "red" if @stock_count == 0
        return "amber"
    end

    # ---------------------- DB Methods ---------------------- #

    # (C)reate
    def save()
        sql = "INSERT INTO books (
            title,
            author_id,
            publisher_id,
            description,
            genre,
            buy_cost,
            sell_price,
            stock_count,
            copies_sold
        ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id;"
        values = [
            @title,
            @author_id,
            @publisher_id,
            @description,
            @genre,
            @buy_cost,
            @sell_price,
            @stock_count,
            @copies_sold
        ]
        @id = SqlRunner.run(sql, values)[0]["id"].to_i
    end

    # (R)ead - ORDER BY ASC/DESC would not work without string interpolation?
    def self.all(column = "title", direction = "ASC")
        sql = "SELECT * FROM books ORDER BY #{column} #{direction}, title;"
        books_array = SqlRunner.run(sql)
        return Book.map_to_objects(books_array)
    end

    # (U)pdate
    def update()
        sql = "UPDATE books SET (
            title,
            author_id,
            publisher_id,
            description,
            genre,
            buy_cost,
            sell_price,
            stock_count,
            copies_sold
        ) = ($1, $2, $3, $4, $5, $6, $7, $8, $9) WHERE id = $10;"
        values = [
            @title,
            @author_id,
            @publisher_id,
            @description,
            @genre,
            @buy_cost,
            @sell_price,
            @stock_count,
            @copies_sold,
            @id
        ]
        SqlRunner.run(sql, values)
    end

    # (D)elete
    def delete()
        sql = "DELETE FROM books WHERE id = $1";
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def is_bestseller?()
        return false if @copies_sold == 0
        sql = "SELECT COUNT(*) FROM books WHERE copies_sold > $1;"
        values = [@copies_sold]
        count = SqlRunner.run(sql, values)[0]["count"].to_i
        return count == 0
    end

    def self.map_to_objects(books_array)
        return books_array.map {|book_hash| Book.new(book_hash)}
    end

    def self.delete_all()
        SqlRunner.run("DELETE FROM books;")
    end

    def self.find(id)
        sql = "SELECT * FROM books WHERE id = $1"
        values = [id]
        book_hash = SqlRunner.run(sql, values).first()
        return Book.new(book_hash) if book_hash
    end

    def self.filter_by_genre(genre)
        sql = "SELECT * FROM books WHERE genre = $1 ORDER BY title"
        values = [genre]
        books_array = SqlRunner.run(sql, values)
        return Book.map_to_objects(books_array)
    end

end