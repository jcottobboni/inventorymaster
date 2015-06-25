module ActionView
    module Helpers
        module NumberHelper
        def number_to_currency_with_real(number, options = {})
            defaults = {:unit => 'R$', :format => "%u %n", :separator => ",", :delimiter => "."}
            s = number_to_currency_without_real(number, defaults.merge(options))
        end
            alias_method_chain :number_to_currency, :real
        end
    end
end