require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/author")
also_reload("models/*")

# ---------------------- RESTful Actions ---------------------- #

# NEW
get "/authors/new" do
    erb(:"authors/new")
end

# CREATE
post "/authors" do
    Author.new(params).save()
    redirect to "/authors"
end

# INDEX
get "/authors" do
    @authors = Author.all()
    erb(:"authors/index")
end

# SHOW
get "/authors/:id" do
    @author = Author.find(params[:id].to_i)
    @books = @author.books()
    erb(:"authors/show")
end