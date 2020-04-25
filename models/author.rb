require_relative("../db/sql_runner")

class Author

    attr_accessor :first_name, :last_name
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @first_name = options["first_name"]
        @last_name = options["last_name"]
    end

    def display_name()
        return "#{@first_name.capitalize()} #{@last_name.capitalize()}"
    end

    # ---------------------- CRUD Methods ---------------------- #

    # (C)reate
    def save()
        sql = "INSERT INTO authors (first_name, last_name) VALUES ($1, $2) RETURNING id;"
        values = [@first_name, @last_name]
        @id = SqlRunner.run(sql, values)[0]["id"].to_i
    end

    # (R)ead
    def self.all()
        sql = "SELECT * FROM authors ORDER BY id;"
        authors_array = SqlRunner.run(sql)
        return Author.map_to_objects(authors_array)
    end

    # (U)pdate
    def update()
        sql = "UPDATE authors SET (first_name, last_name) = ($1, $2) WHERE id = $3;"
        values = [@first_name, @last_name, @id]
        SqlRunner.run(sql, values)
    end

    # (D)elete
    def delete()
        sql = "DELETE FROM authors WHERE id = $1";
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.map_to_objects(authors_array)
        return authors_array.map {|author_hash| Author.new(author_hash)}
    end

    def self.delete_all()
        SqlRunner.run("DELETE FROM authors;")
    end

end