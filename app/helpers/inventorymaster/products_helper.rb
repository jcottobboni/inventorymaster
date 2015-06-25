module Inventorymaster
  module ProductsHelper
	 def average_cost(unit_cost,ammount)
                if unit_cost == nil
                    if @cost || @average ==0
                        return 0
                    else
                        return  @cost / @average
                    end
                else
                    @average += ammount
                    @cost += unit_cost* ammount
                    return  @cost / @average
                end
            end
  end
end
