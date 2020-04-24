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
        @copies_sold = 0
    end

    def buy_from_publisher(copies)
        @stock_count += copies if copies > 0
    end

end