require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) { attributes_for :user }
  let(:invalid_attributes) { attributes_for :invalid_user }
  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new user as @user" do
      log_out
      get :new, {}, valid_session

      expect(assigns :user).to be_a_new User
    end

    it "is redirects to root_path if logged in" do
      get :new, {}, valid_session

      expect(response).to redirect_to root_path
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, { user: valid_attributes }, valid_session
        }.to change(User, :count).by 1
      end

      it "assigns a newly created user as @user" do
        post :create, { user: valid_attributes }, valid_session

        expect(assigns :user).to be_a User
        expect(assigns :user).to be_persisted
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
        expect(assigns :user).not_to be_persisted
      end

      it "re-renders the 'new' template" do
        post :create, { user: invalid_attributes }, valid_session

        expect(response).to render_template :new
      end
    end
  end

  describe "GET show" do
    it "assigns user_id as @user" do
      get :show, { id: create(:user).id }, valid_session

      expect(assigns :user).to be_a User
    end
  end
end
