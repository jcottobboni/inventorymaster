module Inventorymaster
  class Location < ActiveRecord::Base
  	has_many :products
  end
end
