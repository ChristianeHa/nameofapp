class PaymentsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@user = current_user
		token = params[:stripeToken]
    @newprice = @product.price * 100
  		# Create the charge on Stripe's servers - this will charge the user's card
  		begin
    		charge = Stripe::Charge.create(
      			:amount => @newprice, # amount in cents, again
      			:currency => "EUR",
      			:source => token,
      			:description => params[:stripeEmail],
    		)

        # if charge.paid
        #   Order.create(:product_id => @product.id, :user_id => @user.id, :total => "1")
        # end

  		rescue Stripe::CardError => e
    		body = e.json_body
    		err = body[:error]
    		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    	end
	end
end
