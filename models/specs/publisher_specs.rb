require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative("../publisher")

class PublisherTest < MiniTest::Test

    def setup()
        @publisher = Publisher.new({
            "name" => "Vintage",
            "address" => "Vintage, Penguin Random House, 20 Vauxhall Bridge Road London, SW1V 2SA",
            "email" => "customersupport@penguinrandomhouse.co.uk",
            "phone_number" => "+44 (0)1206 256000"
        })
    end

    def test_publisher_has_name()
        assert_equal("Vintage", @publisher.name)
    end

    def test_publisher_has_address()
        assert_equal("Vintage, Penguin Random House, 20 Vauxhall Bridge Road London, SW1V 2SA", @publisher.address)
    end

    def test_publisher_has_email()
        assert_equal("customersupport@penguinrandomhouse.co.uk", @publisher.email)
    end

    def test_publisher_has_phone_number()
        assert_equal("+44 (0)1206 256000", @publisher.phone_number)
    end

    def test_can_change_name()
        @publisher.name = "Vintage Cheese"
        assert_equal("Vintage Cheese", @publisher.name)
    end

    def test_can_change_address()
        @publisher.address = "Patriothall, Edinburgh"
        assert_equal("Patriothall, Edinburgh", @publisher.address)
    end

    def test_can_change_email()
        @publisher.email = "me@publisher.com"
        assert_equal("me@publisher.com", @publisher.email)
    end

    def test_can_change_phone_number()
        @publisher.phone_number = "12345"
        assert_equal("12345", @publisher.phone_number)
    end

end