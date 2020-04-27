require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/book")
also_reload("models/*")

# ---------------------- RESTful Actions ---------------------- #

# NEW
get "/books/new" do
    erb(:"books/new")
end

# INDEX
get "/books" do
    @books = Book.all()
    erb(:"books/index")
end

# SHOW
get "/books/:id" do
    @book = Book.find(params[:id].to_i)
    erb(:"books/show")
end