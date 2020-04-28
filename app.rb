require("sinatra")
require("sinatra/contrib/all")
require_relative("controllers/publishers_controller")
require_relative("controllers/authors_controller")
require_relative("controllers/books_controller")
also_reload("models/*")

get "/" do
    redirect to "/books"
end