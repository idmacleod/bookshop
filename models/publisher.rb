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

end