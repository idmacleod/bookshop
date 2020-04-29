require("pry")
require_relative("../models/publisher")
require_relative("../models/author")
require_relative("../models/book")

Author.delete_all()
Publisher.delete_all()
Book.delete_all()

# Seed Publishers
publisher1 = Publisher.new({
    "name" => "Vintage",
    "address" => "Vintage, 20 Vauxhall Bridge Road, London, SW1V 2SA",
    "email" => "vintage@penguinrandomhouse.co.uk",
    "phone_number" => "+44 (0)20 7840 8400"
})
publisher1.save()
publisher2 = Publisher.new({
    "name" => "Penguin Books",
    "address" => "Penguin Books Ltd, 80 Strand, London, WC2R 0RL",
    "email" => "penguin@penguinrandomhouse.co.uk",
    "phone_number" => "+44 (0)20 7139 3000"
})
publisher2.save()
publisher3 = Publisher.new({
    "name" => "Sort Of Books",
    "address" => "42 Hattifattener Row, Moominvalley, Finland, M00 M1N",
    "email" => "moomintacular@sortof.fi",
    "phone_number" => "+358(50)123 1234"
})
publisher3.save()
publisher4 = Publisher.new({
    "name" => "Macmillan",
    "address" => "Macmillan, St. Martin's Street, London WC2",
    "email" => "inquiries@macmillan.com",
    "phone_number" => "+44 (0)20 5678 9999"
})
publisher4.save()
publisher5 = Publisher.new({
    "name" => "Faber & Faber",
    "address" => "Faber & Faber Ltd, 74-77 Great Russell Street, London, WC1B 3DA",
    "email" => "members@faber.co.uk",
    "phone_number" => "+44 (0)20 7927 3800"
})
publisher5.save()
publisher6 = Publisher.new({
    "name" => "Harvill Secker",
    "address" => "Harvill Secker, 20 Vauxhall Bridge Road, London, SW1V 2SA",
    "email" => "harvey@penguinrandomhouse.co.uk",
    "phone_number" => "+44 (0)20 8097 6543"
})
publisher6.save()
publisher7 = Publisher.new({
    "name" => "Picador",
    "address" => "Picador, Pan Macmillan, 20 New Wharf Road, London N1 9RR",
    "email" => "picador@panmacmillan.com",
    "phone_number" => "+44 (0)20 7401 9817"
})
publisher7.save()

# Seed Authors
author1 = Author.new({"first_name" => "Haruki", "last_name" => "Murakami"})
author1.save()
author2 = Author.new({"first_name" => "Kurt", "last_name" => "Vonnegut"})
author2.save()
author3 = Author.new({"first_name" => "Tove", "last_name" => "Jansson"})
author3.save()
author4 = Author.new({"first_name" => "Enid", "last_name" => "Blyton"})
author4.save()
author5 = Author.new({"first_name" => "Milan", "last_name" => "Kundera"})
author5.save()
author6 = Author.new({"first_name" => "Mikhail", "last_name" => "Bulgakov"})
author6.save()

# Seed Books
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
book3 = Book.new({
    "title" => "Tales from Moominvalley",
    "author_id" => author3.id,
    "publisher_id" => publisher3.id,
    "description" => "Collection of short stories from Tove Jansson's Moominverse.",
    "genre" => "Children's",
    "buy_cost" => "300",
    "sell_price" => "499",
    "stock_count" => "200"
})
book3.save()
book4 = Book.new({
    "title" => "Moominvalley in November",
    "author_id" => author3.id,
    "publisher_id" => publisher3.id,
    "description" => "Tove Jansson's final Moomin novel - subtly philosophical and profound.",
    "genre" => "Children's",
    "buy_cost" => "750",
    "sell_price" => "1099",
    "stock_count" => "50"
})
book4.save()
book5 = Book.new({
    "title" => "The Strange Library",
    "author_id" => author1.id,
    "publisher_id" => publisher6.id,
    "description" => "Beautifully illustrated tale from the Japanese maestro.",
    "genre" => "Fiction",
    "buy_cost" => "800",
    "sell_price" => "1299",
    "stock_count" => "10"
})
book5.save()
book6 = Book.new({
    "title" => "The River of Adventure",
    "author_id" => author4.id,
    "publisher_id" => publisher4.id,
    "description" => "Enid Blyton's final Adventure novel - a mystery set in the Middle East.",
    "genre" => "Children's",
    "buy_cost" => "299",
    "sell_price" => "499",
    "stock_count" => "300"
})
book6.save()
book7 = Book.new({
    "title" => "The Island of Adventure",
    "author_id" => author4.id,
    "publisher_id" => publisher4.id,
    "description" => "Enid Blyton's first Adventure novel - introducing Philip, Jack, Dinah, and Lucy-Ann.",
    "genre" => "Children's",
    "buy_cost" => "299",
    "sell_price" => "499",
    "stock_count" => "300"
})
book7.save()
book8 = Book.new({
    "title" => "The Unbearable Lightness of Being",
    "author_id" => author5.id,
    "publisher_id" => publisher5.id,
    "description" => "Tragi-comic contemporary classic.",
    "genre" => "Fiction",
    "buy_cost" => "600",
    "sell_price" => "799",
    "stock_count" => "450"
})
book8.save()
book9 = Book.new({
    "title" => "The Master and Margarita",
    "author_id" => author6.id,
    "publisher_id" => publisher7.id,
    "description" => "Seminal work of 20th century Russian literature, set in the 1930s.",
    "genre" => "Fiction",
    "buy_cost" => "400",
    "sell_price" => "799",
    "stock_count" => "125"
})
book9.save()

publishers = Publisher.all()
authors = Author.all()
books = Book.all()

binding.pry
nil
