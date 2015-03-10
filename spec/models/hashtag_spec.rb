require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  context 'Associations' do
    it { is_expected.to have_and_belong_to_many :tweets }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :keyword }
    it { is_expected.to validate_uniqueness_of :keyword }
  end

  context 'Attributes' do
    it { is_expected.to have_db_column(:keyword).of_type :string }
  end

  context 'Indexes' do
    it { is_expected.to have_db_index :keyword }
  end
end
