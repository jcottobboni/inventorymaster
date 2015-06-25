module Inventorymaster
  class Transaction < ActiveRecord::Base
  	belongs_to :location
  	belongs_to :user
           belongs_to :transaction_type
           belongs_to :product
  end
end
