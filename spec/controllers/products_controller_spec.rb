require 'rails_helper'

describe ProductsController, :type => :controller do

  before do
    @product = FactoryGirl.create(:product)
  end

	context 'GET #index' do
    before do
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end


  context 'GET #show' do
    before do
      get :show
    end

  	it 'loads correct product detail' do
  		get :show, id: @product.id
  		expect(response).to have_http_status(200)
  		expect(assigns(:product)).to eq @product
  	end

  end


  context 'GET #new' do
    before do
      get :new
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the new template' do
      expect(response).to render_template('new')
    end
  end

	 context 'GET #edit' do
     before do
      get :edit
    end

  	it 'loads correct product detail' do
  		get :edit, id: @product.id
  		expect(response).to have_http_status(200)
  		expect(assigns(:product)).to eq @product
  	end

  end
  

  describe 'POST #create' do


  end

  describe 'PATCH #update' do


  end

  describe 'DELETE #destroy' do

  end




end