require_relative("../db/sql_runner")
require_relative("book")

class Publisher

    attr_accessor :name, :address, :email, :phone_number
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @address = options["address"]
        @email = options["email"]
        @phone_number = options["phone_number"]
    end

    # ---------------------- DB Methods ---------------------- #

    # (C)reate
    def save()
        sql = "INSERT INTO publishers (name, address, email, phone_number) VALUES ($1, $2, $3, $4) RETURNING id;"
        values = [@name, @address, @email, @phone_number]
        @id = SqlRunner.run(sql, values)[0]["id"].to_i
    end

    # (R)ead
    def self.all()
        sql = "SELECT * FROM publishers ORDER BY name;"
        publishers_array = SqlRunner.run(sql)
        return Publisher.map_to_objects(publishers_array)
    end

    # (U)pdate
    def update()
        sql = "UPDATE publishers SET (name, address, email, phone_number) = ($1, $2, $3, $4) WHERE id = $5;"
        values = [@name, @address, @email, @phone_number, @id]
        SqlRunner.run(sql, values)
    end

    # (D)elete
    def delete()
        sql = "DELETE FROM publishers WHERE id = $1";
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def books()
        sql = "SELECT * FROM books WHERE publisher_id = $1 ORDER BY id"
        values = [@id]
        books_array = SqlRunner.run(sql, values)
        return Book.map_to_objects(books_array)
    end

    def self.map_to_objects(publishers_array)
        return publishers_array.map {|publisher_hash| Publisher.new(publisher_hash)}
    end

    def self.delete_all()
        SqlRunner.run("DELETE FROM publishers;")
    end

    def self.find(id)
        sql = "SELECT * FROM publishers WHERE id = $1"
        values = [id]
        publisher_hash = SqlRunner.run(sql, values).first()
        return Publisher.new(publisher_hash) if publisher_hash
    end

end