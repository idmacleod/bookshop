require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/author")
also_reload("models/*")

# ---------------------- RESTful Actions ---------------------- #

# INDEX
get "/authors" do
    @authors = Author.all()
    erb(:"authors/index")
end