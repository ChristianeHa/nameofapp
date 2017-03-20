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
      			:description => params[:stripeEmail]
    		)

        if charge.paid
          Order.create(:product_id => @product.id, :user_id => @user.id, :total => @newprice)
        end

  		rescue Stripe::CardError => e
    		body = e.json_body
    		err = body[:error]
    		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"

      rescue Stripe::RateLimitError => e
        body = e.json_body
        err = body[:error]
        flash[:error] = "If you are not a robot, you were to quick for our system: #{err[:message]}"

      rescue Stripe::InvalidRequestError => e
        body = e.json_body
        err = body[:error]
        flash[:error] = "Uuups, there was something wrong with your input: #{err[:message]}"

      rescue Stripe::AuthenticationError => e
        body = e.json_body
        err = body[:error]
        flash[:error] = "There is something wrong with our form - sorry!: #{err[:message]}"

      rescue Stripe::AuthenticationError => e
        body = e.json_body
        err = body[:error]
        flash[:error] = "Are you online? We can't reach Stripe at the moment: #{err[:message]}"

      rescue Stripe::AuthenticationError => e
        body = e.json_body
        err = body[:error]
        flash[:error] = "Something went wrong (We don't know what it is either, don't worry): #{err[:message]}"

      rescue => e

    	end
	end
end
