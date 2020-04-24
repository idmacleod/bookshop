class Sterling

    attr_reader :pounds, :pence

    def initialize(pounds, pence)
        @pounds = pounds
        @pence = pence
    end

    def display()
        return "£#{@pounds}.00" if @pence == 0
        return "£#{@pounds}.0#{@pence}" if @pence < 10
        return "£#{@pounds}.#{@pence}"
    end

    def self.add(s1, s2)
        new_pounds = s1.pounds + s2.pounds
        new_pence = s1.pence + s2.pence
        if new_pence > 100
            new_pounds += 1
            new_pence -= 100
        end
        return Sterling.new(new_pounds, new_pence)
    end

end
