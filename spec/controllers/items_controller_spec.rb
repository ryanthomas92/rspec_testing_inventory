require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "#show" do
    it "renders the :show view" do
      item = Item.create({size:'s', color:'blue', status:'unsold'})
      get :show, id: item.id
      expect(response).to render_template(:show)
    end
  end
end
