require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/book")
also_reload("models/*")

# ---------------------- RESTful Actions ---------------------- #

# INDEX
get "/books" do
    @books = Book.all()
    erb(:"books/index")
end