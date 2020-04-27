require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/publisher")
also_reload("models/*")

# ---------------------- RESTful Actions ---------------------- #

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