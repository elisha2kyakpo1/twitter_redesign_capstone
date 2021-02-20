require 'rails_helper.rb'
RSpec.describe User do
  let(:subject) do
    described_class.new(
      username: 'myusername',
      full_name: 'myuser fullname'
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:full_name) }

    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end

    it 'The username of the user should exist' do
      subject.username = ''
      expect(subject).not_to be_valid
    end

    it 'The name of the user should not be longer than 20 characters' do
      subject.username = 'weiruwieruiowueriuioweuriuwioeurwioeriouiowerui'
      expect(subject).not_to be_valid
    end

    it 'The full_name should exist' do
      subject.full_name = ''
      expect(subject).not_to be_valid
    end

    it 'The full_name should not be longer than 50 characters' do
      subject.full_name = 'kwehjkwehfkjewhfewhfkdhfkdhfkdhfkdjfkldjfkljflkwjflwdjflkdjfkldjfklsdf'
      expect(subject).not_to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { is_expected.to have_many(:tweets) }
    it { is_expected.to have_many(:following) }
    it { is_expected.to have_many(:followers) }
  end
end
