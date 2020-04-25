require("pry")
require_relative("../models/publisher")
require_relative("../models/author")
require_relative("../models/book")

Author.delete_all()

author1 = Author.new({"first_name" => "Haruki", "last_name" => "Murakami"})
author1.save()
author2 = Author.new({"first_name" => "Kurt", "last_name" => "Vonnegut"})
author2.save()

authors = Author.all()

binding.pry
nil
