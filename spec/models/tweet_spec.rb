require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'Associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_and_belong_to_many :hashtags }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :user }

    it { is_expected.to validate_presence_of :message }
    it { is_expected.to validate_length_of(:message).is_at_most 140 }
  end

  context 'Attributes' do
    it { is_expected.to have_db_column(:user_id).of_type :integer }
    it { is_expected.to have_db_column(:message).of_type :string }
  end

  context 'Indexes' do
    it { is_expected.to have_db_index :user_id }
  end
end
