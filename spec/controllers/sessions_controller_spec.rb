require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do @user = create :user end
  let(:valid_attributes) { { username: @user.username, password: @user.password } }
  let(:invalid_attributes) { { username: nil, password: nil } }
  let(:valid_session) { {} }

  describe "GET new" do
    it "renders the 'new' template" do
      get :new, {}, valid_session

      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid params" do

      it "assigns a logged in session as @user" do
        post :create, { session: valid_attributes }, valid_session

        expect(assigns :user).to be_a User
      end

      it "redirects to the tweets timeline" do
        post :create, { session: valid_attributes }, valid_session

        expect(response).to redirect_to tweets_path
      end
    end

    context "with invalid params" do
      it "re-renders the 'new' template" do
        post :create, { session: invalid_attributes }, valid_session

        expect(response).to render_template :new
      end
    end
  end
end
