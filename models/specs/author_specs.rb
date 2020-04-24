require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../author")

class AuthorTest < MiniTest::Test

    def setup()
        @author = Author.new({"first_name" => "Haruki", "last_name" => "Murakami"})
    end

    def test_author_has_first_name()
        assert_equal("Haruki", @author.first_name)
    end

    def test_author_has_last_name()
        assert_equal("Murakami", @author.last_name)
    end

    def test_full_name()
        assert_equal("Haruki Murakami", @author.full_name())
    end

    def test_can_change_names()
        @author.first_name = "Kiharu"
        @author.last_name = "Kamimura"
        assert_equal("Kiharu Kamimura", @author.full_name())
    end

end