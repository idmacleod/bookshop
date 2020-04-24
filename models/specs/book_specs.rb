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

    def test_buy_from_publisher()
        @book.buy_from_publisher(5)
        @book.buy_from_publisher(6)
        @book.buy_from_publisher(0)
        assert_equal(14, @book.stock_count)
    end

    def test_cannot_buy_negative_copies()
        @book.buy_from_publisher(-45)
        assert_equal(3, @book.stock_count)
    end

    def test_enough_stock__true()
        assert(@book.enough_stock?(2))
    end

    def test_enough_stock__false()
        refute(@book.enough_stock?(4))
    end

    def test_sell_to_customer()
        @book.sell_to_customer(2)
        @book.sell_to_customer(0)
        assert_equal(1, @book.stock_count)
        assert_equal(2, @book.copies_sold)
        @book.sell_to_customer(1)
        assert_equal(0, @book.stock_count)
        assert_equal(3, @book.copies_sold)
    end

    def test_cannot_sell_negative_copies()
        @book.sell_to_customer(-8)
        assert_equal(3, @book.stock_count)
    end

    def test_cannot_sell_copies_if_not_enough_stock()
        @book.sell_to_customer(5)
        assert_equal(3, @book.stock_count)
    end

end