require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:valid_attributes) { create(:user).attributes }
  let(:invalid_attributes) { attributes_for :invalid_user }
  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session

      expect(assigns :user ).to be_a_new User
    end
  end

  describe "POST create" do
    context "with valid params" do

      it "assigns a logged in user as @user" do
        post :create, { user: valid_attributes }, valid_session

        expect(assigns :user).to be_a User
      end

      it "redirects to the tweets timeline" do
        post :create, { user: valid_attributes }, valid_session

        expect(response).to redirect_to tweets_path
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, { user: invalid_attributes }, valid_session

        expect(assigns :user).to be_a_new User
      end

      it "re-renders the 'new' template" do
        post :create, { user: invalid_attributes }, valid_session

        expect(response).to render_template :new
      end
    end
  end
end
