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
      @producttwo = FactoryGirl.create(:product)
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'redirects to product overview' do
        expect(response).to redirect_to(products_path)
    end

    it 'creates new product' do
      expect(@producttwo).to be_truthy

    end

  end

  context 'PUT #update' do
    before do
      @producttwo = FactoryGirl.create(:product)
      #@producttwo.update(:name => 'Best bike')
      put :update, id: @producttwo, producttwo: @producttwo
      @producttwo.reload
    end
    
    it 'redirects to single product overview' do
        expect(response).to redirect_to(product_path)
    end


    it 'updated name successfully' do
        expect(@producttwo.name).to eq("Best bike")   
    end
    
  end

  context 'DELETE #destroy' do
    before do
      @productthree = FactoryGirl.create(:product)
      delete :destroy, id: @productthree
    end

    it 'redirects to product overview' do
          expect(response).to redirect_to(products_path)
    end

    it 'deletes the product' do
    end


  end



end