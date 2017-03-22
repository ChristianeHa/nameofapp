class UserRegistrationsController < Devise::RegistrationsController

	prepend_before_action :check_captcha, only: [:create] 

  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
    end
  end

  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        respond_with_navigational(resource) { render :new }
       else
       	User.create
      end 
   end


end
