require("pry")
require_relative("../models/publisher")
require_relative("../models/author")
require_relative("../models/book")

Author.delete_all()
Publisher.delete_all()

# Seed Publishers
publisher1 = Publisher.new({
    "name" => "Vintage",
    "address" => "Vintage, Penguin Random House, 20 Vauxhall Bridge Road, London, SW1V 2SA",
    "email" => "customersupport@penguinrandomhouse.co.uk",
    "phone_number" => "+44 (0)20 7840 8400"
})
publisher1.save()
publisher2 = Publisher.new({
    "name" => "Penguin Books",
    "address" => "Penguin Books Ltd, 80 Strand, London, WC2R 0RL",
    "email" => "customersupport@penguinrandomhouse.co.uk",
    "phone_number" => "+44 (0)20 7139 3000"
})
publisher2.save()

#Seed Authors
author1 = Author.new({"first_name" => "Haruki", "last_name" => "Murakami"})
author1.save()
author2 = Author.new({"first_name" => "Kurt", "last_name" => "Vonnegut"})
author2.save()

#Seed Books
book1 = Book.new({
    "title" => "Dance Dance Dance",
    "author_id" => author1.id,
    "publisher_id" => publisher1.id,
    "description" => "Surreal sequel to 'A Wild Sheep Chase', inspired by film noir.",
    "genre" => "Fiction",
    "buy_cost" => "400",
    "sell_price" => "699",
    "stock_count" => "100"
})
book1.save()
book2 = Book.new({
    "title" => "Cat's Cradle",
    "author_id" => author2.id,
    "publisher_id" => publisher2.id,
    "description" => "Apocalyptic sci-fi black comedy.",
    "genre" => "Science Fiction",
    "buy_cost" => "300",
    "sell_price" => "799",
    "stock_count" => "250"
})
book2.save()

publishers = Publisher.all()
authors = Author.all()
books = Book.all()

binding.pry
nil
