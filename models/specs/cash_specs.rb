require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative("../cash")

class CashTest < MiniTest::Test

    def test_in_pounds__postive()
        assert_equal("£123.45", Cash.in_pounds(12345))
    end

    def test_in_pounds__negative()
        assert_equal("-£123.45", Cash.in_pounds(-12345))
    end

    def test_in_pounds__zero()
        assert_equal("£0.00", Cash.in_pounds(0))
    end

    def test_in_pounds__less_than_one_pound()
        assert_equal("£0.45", Cash.in_pounds(45))
    end

end