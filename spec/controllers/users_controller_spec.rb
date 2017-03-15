require 'rails_helper'

describe UsersController, :type => :controller do

	let(:user) { User.create!(email: 'maxmustermann@example.de', password: 'Password') }
	let(:usertwo) { User.create!(email: 'tinamustermann@example.de', password: 'Password') }

  		describe 'GET #show' do

     		context 'User is logged in' do
     			before do
  					sign_in user
  				end

  				it 'loads correct user detail' do
  					get :show, id: user.id
  					expect(response).to have_http_status(200)
  					expect(assigns(:user)).to eq user
  				end
     		end

     		context 'No user is logged in' do
       			it 'redirects to login' do
         			get :show, id: user.id
         			expect(response).to redirect_to(new_user_session_path)
       			end
     		end

     		context 'User is logged in' do
     			before do
  					sign_in user
  				end

  				it 'First user can t access Show page of second users' do
  					get :show, id: usertwo.id
  					expect(response).to redirect_to(root_path)
  				end
     		end

     		
  	end

end