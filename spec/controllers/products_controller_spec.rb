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
      get :show, id: @product.id
    end

  	it 'loads correct product detail' do
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
      get :edit, id: @product.id
    end

  	it 'loads correct product detail' do
  		get :edit, id: @product.id
  		expect(response).to have_http_status(200)
  		expect(assigns(:product)).to eq @product
  	end

  end
  
  context 'POST #create' do
    before do
      post :create, product: FactoryGirl.attributes_for(:product)
    end

    it 'redirects to product overview' do
        expect(response).to redirect_to(products_path)
    end

    it 'creates new product' do
      expect{post :create, product: FactoryGirl.attributes_for(:product)}.to change(Product, :count).by(1)
    end

  end

  context 'PUT #update' do
    before do
      @producttwo = FactoryGirl.create(:product)
      @updated_attributes = { :name => "Classic Bike"}
      put :update, id: @producttwo, product: @updated_attributes
      @producttwo.reload
    end
    
    it 'redirects to single product overview' do
        expect(response).to redirect_to(product_path)
    end


    it 'updated name successfully' do
        expect(@producttwo).to have_attributes(:name => "Classic Bike")
    end

  end

  context 'DELETE #destroy' do
    before :each do
      @productthree = FactoryGirl.create(:product)
      
    end

    it 'deletes the product' do
        expect{delete :destroy, id: @productthree}.to change(Product, :count).by(-1)
    end

    it 'redirects to product overview' do
        delete :destroy, id: @productthree
        expect(response).to redirect_to(products_path)
    end


  end



end