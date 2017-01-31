require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "#show" do
    let(:item) {Item.create({size:'s', color:'blue', status:'unsold'}) }

    before(:each) do
      get :show, id: item.id
    end

    it "renders the :show view" do
      expect(response).to render_template(:show)
    end

    it "assigns @item" do
      expect(assigns(:item)).to eq(item)
    end
  end

  describe "#create" do
    context "success" do
      let(:item_hash) { {size: "XL", color: "heather", status: "sold"} }
      before(:each) do
        post :create, item: item_hash
      end
      it "redirects to 'item_path'" do
        expect(response.status).to be(302)
        expect(response.location).to match(/\/items\/\d+/)
      end
    end
  end

end
