require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative("../sterling")

class SterlingTest < MiniTest::Test

    def setup()
        @sterling1 = Sterling.new(63, 52)
        @sterling2 = Sterling.new(4, 10)
        @sterling3 = Sterling.new(7, 50)
    end

    def test_has_pounds
        assert_equal(63, @sterling1.pounds)
    end

    def test_has_pence
        assert_equal(52, @sterling1.pence)
    end
    
    def test_display
        assert_equal("£4.10", @sterling2.display())
    end

    def test_add_simple
        assert_equal("£67.62", sterling.add(@sterling1, @sterling2).display())
    end

    def test_add_complex
        assert_equal("£71.02", sterling.add(@sterling1, @sterling3).display())
    end

end