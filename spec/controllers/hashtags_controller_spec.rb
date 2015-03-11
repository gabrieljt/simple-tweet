require 'rails_helper'

RSpec.describe HashtagsController, type: :controller do

  let(:valid_attributes) { attributes_for :hashtag }
  let(:invalid_attributes) { attributes_for :invalid_hashtag }
  let(:valid_session) { {} }

  describe "GET show" do
    it "assigns hashtag_id as @hashtag" do
      get :show, { id: create(:hashtag).id }, valid_session

      expect(assigns :hashtag).to be_a Hashtag
    end
  end

end
