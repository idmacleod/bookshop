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
    params[:buy_cost] = Cash.in_pence(params[:buy_cost])
    params[:sell_price] = Cash.in_pence(params[:sell_price])
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

# EDIT
get "/books/:id/edit" do
    @book = Book.find(params[:id].to_i)
    @authors = Author.all()
    @publishers = Publisher.all()
    erb(:"books/edit")
end

# UPDATE
post "/books/:id" do
    params[:buy_cost] = Cash.in_pence(params[:buy_cost])
    params[:sell_price] = Cash.in_pence(params[:sell_price])
    Book.new(params).update()
    redirect to "/books"
end

# DESTROY
post "/books/:id/delete" do
    Book.find(params[:id].to_i).delete()
    redirect to "/books"
end

# ------------------------------------------------------------- #

# Path for buying books
post "/books/:id/buy" do
    book = Book.find(params[:id].to_i)
    book.buy_from_publisher(params[:copies].to_i)
    redirect to "/books/#{params[:id]}"
end

# Path for selling books
post "/books/:id/sell" do
    book = Book.find(params[:id].to_i)
    book.sell_to_customer(params[:copies].to_i)
    redirect to "/books/#{params[:id]}"
end

# Helper functions for sorting
def sorted_on?(sort, direction)
    return (sort == @sort && direction == @direction)
end

def get_arrow(column)
    return "&#8593;" if sorted_on?(column, "ASC")
    return "&#8595;" if sorted_on?(column, "DESC")
end

def on_click(column)
    return "/books/#{column}/desc" if sorted_on?(column, "ASC")
    return "/books" if sorted_on?(column, "DESC")
    return "/books/#{column}/asc"
end

# Path for filtering by genre
get "/books/filter/:genre" do
    @genre = params[:genre]
    @books = Book.filter_by_genre(@genre)
    erb(:"books/index")
end

# Path for sorting
get "/books/:sort/:direction" do
    @sort = params[:sort]
    @direction = params[:direction].upcase()
    @books = Book.all(@sort, @direction)
    erb(:"books/index")
end

# Emoji picker by genre
def emoji(genre)
    return "🪐" if genre.downcase() == "science fiction"
    return "🐉" if genre.downcase() == "fantasy"
    return "🧸" if genre.downcase() == "children's"
    return "📖"
end