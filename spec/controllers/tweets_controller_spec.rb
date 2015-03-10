require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  let(:current_user) { create :user }
  let(:valid_attributes) { attributes_for :tweet }
  let(:invalid_attributes) { attributes_for :invalid_tweet }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns a new tweet as @tweet" do
      get :index, {}, valid_session

      expect(assigns :tweet ).to be_a_new Tweet
    end

    it "assigns all tweets descending as @tweets" do
      tweet_one = create :tweet
      tweet_two = create :tweet

      get :index, {}, valid_session

      expect(assigns :tweets).to eq [tweet_two, tweet_one]
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Tweet" do
        expect {
          post :create, { tweet: valid_attributes }, valid_session
        }.to change(Tweet, :count).by 1
      end

      it "assigns a newly created tweet as @tweet" do
        post :create, { tweet: valid_attributes }, valid_session

        expect(assigns :tweet).to be_a Tweet
        expect(assigns :tweet).to be_persisted
      end

      it "redirects to the index" do
        post :create, { tweet: valid_attributes }, valid_session

        expect(response).to redirect_to tweets_path
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved tweet as @tweet" do
        post :create, { tweet: invalid_attributes }, valid_session

        expect(assigns :tweet).to be_a_new Tweet
        expect(assigns :tweet).not_to be_persisted
      end

      it "re-renders the 'index' template" do
        post :create, { tweet: invalid_attributes }, valid_session

        expect(response).to render_template :index
      end
    end
  end
end
