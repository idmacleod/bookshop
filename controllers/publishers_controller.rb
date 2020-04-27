require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/publisher")
also_reload("models/*")

# ---------------------- RESTful Actions ---------------------- #

# NEW
get "/publishers/new" do
    erb(:"publishers/new")
end

# CREATE
post "/publishers" do
    Publisher.new(params).save()
    redirect to "/publishers"
end

# INDEX
get "/publishers" do
    @publishers = Publisher.all()
    erb(:"publishers/index")
end

# SHOW
get "/publishers/:id" do
    @publisher = Publisher.find(params[:id].to_i)
    @books = @publisher.books()
    erb(:"publishers/show")
end

# EDIT
get "/publishers/:id/edit" do
    @publisher = Publisher.find(params[:id].to_i)
    erb(:"publishers/edit")
end

# UPDATE
post "/publishers/:id" do
    Publisher.new(params).update()
    redirect to "/publishers"
end