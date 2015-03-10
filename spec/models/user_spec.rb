require 'rails_helper'

RSpec.describe User, type: :model do
  before do create :user end # TODO: verify error "User Validations should require case sensitive unique value for username"

  context 'Associations' do
    it { is_expected.to have_many :tweets }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }

    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
  end

  context 'Attributes' do
    it { is_expected.to have_db_column(:username).of_type :string }
    it { is_expected.to have_db_column(:email).of_type :string }
  end

  context 'Indexes' do
    it { is_expected.to have_db_index :username }
    it { is_expected.to have_db_index :email }
  end
end
