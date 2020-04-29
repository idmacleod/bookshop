require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative("../cash")

class CashTest < MiniTest::Test

    def test_in_pounds__postive()
        assert_equal("123.45", Cash.in_pounds(12345))
    end

    def test_in_pounds__negative()
        assert_equal("-40.01", Cash.in_pounds(-4001))
    end

    def test_in_pounds__zero()
        assert_equal("0.00", Cash.in_pounds(0))
    end

    def test_in_pounds__less_than_one_pound()
        assert_equal("0.45", Cash.in_pounds(45))
    end

    def test_in_pence__postive()
        assert_equal(499, Cash.in_pence("4.99"))
    end

    def test_in_pence__negative()
        assert_equal(-401, Cash.in_pence("-4.01"))
    end

    def test_in_pence__zero()
        assert_equal(0, Cash.in_pence("0.00"))
    end

    def test_in_pence__less_than_one_pound()
        assert_equal(81, Cash.in_pence("0.81"))
    end

    def test_in_pence__less_than_one_pence()
        assert_equal(0, Cash.in_pence("0.001"))
    end

    def test_in_pence__extra_decimal()
        assert_equal(487, Cash.in_pence("4.873"))
    end

    def test_in_pence__extra_decimal_round_down()
        assert_equal(6501, Cash.in_pence("65.018"))
    end

end