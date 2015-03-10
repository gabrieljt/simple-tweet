require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it { is_expected.to have_many :tweets }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }
  end

  context 'Attributes' do
    it { is_expected.to have_db_column(:id).of_type :integer }
    it { is_expected.to have_db_column(:username).of_type :string }
    it { is_expected.to have_db_column(:password_digest).of_type :string }
  end

  context 'Indexes' do
    it { is_expected.to have_db_index :username }
  end
end
