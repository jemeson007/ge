class Cheese < ApplicationRecord
	require "active_merchant/billing/rails"


	attr_accessor :credit_card_number
	attr_accessor :card_security_code
	attr_accessor :expiration_month
	attr_accessor :expiration_year

	validates :first_name, presence:  true
	validates :last_name, presence: true
	validates :credit_card_number, presence: true
	validates :card_security_code, presence: true
	validates :expiration_month, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12}
    validates :expiration_year, presence: true
    validates :amount, presence: true, numericality: { greater_than: 0 }

    validate :valid_card

    belongs_to :person
    belongs_to :property, optional: true

    has_many :properties, inverse_of: :cheese 
    accepts_nested_attributes_for :properties


    def credit_card
      ActiveMerchant::Billing::CreditCard.new(
         
         number: 				credit_card_number,
         verification_value: 	card_security_code,
         month: 				expiration_month,
         year: 					expiration_year,
         first_name: 			first_name,
         last_name: 			last_name

         )	
    		
    end

    def valid_card
      if !credit_card.valid?
      	errors.add(:base, "The card information is invalid. Do a double check and go again.") and return
      	false
      else
      	true
      end
    		
    end

    def process
      if valid_card
      	response  = GATEWAY.authorize(amount * 100, credit_card)
      	if response.success?
      	  transaction = GATEWAY.capture(amount * 100, response.authorization)
      	  if !transaction.success?
      	  	errors.add(:base, "The card is declined. Do a double check and go again.") and return
      	  	false
      	  end	
      	update_columns({authorization_code: transaction.authorization, success: true})
      	true
      	else
        errors.add(:base, "The card is declined. Do a double check and go again.")	and return
        false
      	end
      	
      end
    		
 	end	

end
