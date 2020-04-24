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

end