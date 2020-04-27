require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/book")
require_relative("../models/author")
require_relative("../models/publisher")
also_reload("models/*")

# ---------------------- RESTful Actions ---------------------- #

# NEW
get "/books/new" do
    @authors = Author.all()
    @publishers = Publisher.all()
    erb(:"books/new")
end

# CREATE
post "/books" do
    puts params
    Book.new(params).save()
    redirect to "/books"
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