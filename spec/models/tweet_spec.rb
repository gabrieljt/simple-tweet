require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'Associations' do
    it { is_expected.to belong_to :user }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :content }
  end

  context 'Attributes' do
    it { is_expected.to have_db_column(:user_id).of_type :integer }
    it { is_expected.to have_db_column(:content).of_type :string }
  end

  context 'Indexes' do
    it { is_expected.to have_db_index :user_id }
  end
end
