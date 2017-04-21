require 'rails_helper'

describe ProductsController, :type => :controller do

  before do
    @product = FactoryGirl.create(:product)
  end

	context 'GET #index' do
    subject {
      get :index
    }

    before do
      subject
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
    subject {
      get :show, id: @product.id
    }

    before do
      subject
    end

  	it 'loads correct product detail' do
  		expect(response).to have_http_status(200)
  		expect(assigns(:product)).to eq @product
  	end

  end


  context 'GET #new' do
    subject {
      get :new
    }

    before do
      subject
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
    subject {
      get :edit, id: @product.id
    }

    before do
      subject
    end

  	it 'loads correct product detail' do
  		subject
  		expect(response).to have_http_status(200)
  		expect(assigns(:product)).to eq @product
  	end

  end
  
  context 'POST #create' do
    subject {
      post :create, product: FactoryGirl.attributes_for(:product)
    }

    before do
      subject
    end

    it 'redirects to product overview' do
        expect(response).to redirect_to(products_path)
    end

    it 'creates new product' do
      expect{subject}.to change(Product, :count).by(1)
    end

  end

  context 'PUT #update' do

    subject {
      put :update, id: @producttwo, product: @updated_attributes
    }

    before do
      @producttwo = FactoryGirl.create(:product)
      @updated_attributes = { :name => "Classic Bike"}
      subject
    end

    
    it 'redirects to single product overview' do
        expect(response).to redirect_to(product_path)
    end


    it 'updated name successfully' do
        expect(@producttwo.reload).to have_attributes(:name => "Classic Bike")
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