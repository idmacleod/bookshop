require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative("../book")

class BookTest < MiniTest::Test

    def setup()
        @book = Book.new({
            "title" => "Dance Dance Dance",
            "author_id" => "100",
            "publisher_id" => "200",
            "description" => "Surreal sequel to 'A Wild Sheep Chase', inspired by film noir.",
            "genre" => "Fiction",
            "buy_cost" => "400",
            "sell_price" => "699",
            "stock_count" => "3"
        })
    end

    def test_book_has_title()
        assert_equal("Dance Dance Dance", @book.title)
    end

    def test_book_has_author_id()
        assert_equal(100, @book.author_id)
    end

    def test_book_has_publisher_id()
        assert_equal(200, @book.publisher_id)
    end

    def test_book_has_description()
        assert_equal("Surreal sequel to 'A Wild Sheep Chase', inspired by film noir.", @book.description)
    end

    def test_book_has_genre()
        assert_equal("Fiction", @book.genre)
    end

    def test_book_has_buy_cost()
        assert_equal(400, @book.buy_cost)
    end

    def test_book_has_sell_price()
        assert_equal(699, @book.sell_price)
    end

    def test_books_has_stock_count()
        assert_equal(3, @book.stock_count)
    end

    def test_copies_sold_starts_at_zero()
        assert_equal(0, @book.copies_sold)
    end

end