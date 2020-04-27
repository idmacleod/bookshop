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
    
