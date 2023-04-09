require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:published_at) }
    it { should validate_presence_of(:description) }

    it { should validate_length_of(:title).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:genre).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:description).is_at_least(10).is_at_most(2000) }

    it { should validate_numericality_of(:year).only_integer }
    it { should validate_numericality_of(:year).is_greater_than_or_equal_to(1800).is_less_than_or_equal_to(Date.today.year) }
  end
end
