require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:voter) { User.create(id: 1, username: 'elisha', full_name: 'elsha kyakopo') }
  let(:tweet) { Tweet.create(text: 'This is content of the post') }
  let(:subject) do
    described_class.new(
      tweet: tweet,
      voter: voter
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
