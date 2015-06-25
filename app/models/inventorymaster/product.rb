module Inventorymaster
  class Product < ActiveRecord::Base
      searchkick  callbacks: :async,autocomplete: ['name','sku']


  	belongs_to :location
  	belongs_to :area
  	belongs_to :manufacturer
  	has_many :transactions
  	accepts_nested_attributes_for :transactions

  	validates_uniqueness_of :sku
  	before_save do
  		if self.sku.blank?
    		self.sku = build_token(6)
    	end
  	end
  	def build_token(size)
  	begin
	  charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
	  sku = (0...size).map{ charset.to_a[rand(charset.size)] }.join
	  end while Product.exists?(sku: sku)
	  sku
	end

  end
end
