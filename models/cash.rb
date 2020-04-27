class Cash

    def self.in_pounds(amount_in_pence)
        return "£0.00" if amount_in_pence == 0
        return "-" + Cash.in_pounds(-amount_in_pence) if amount_in_pence < 0
        pounds = amount_in_pence / 100
        remainder = amount_in_pence % 100
        return "£#{pounds}.00" if remainder == 0
        return "£#{pounds}.0#{remainder}" if remainder < 10
        return "£#{pounds}.#{remainder}"
    end

    def self.in_pence(amount_in_pounds)
        return (amount_in_pounds * 100).to_i
    end

end