RSpec.describe User do
  let(:subject) do
    described_class.new(
      username: 'myusername',
      fullname: 'myuser fullname'
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:fullname) }

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

    it 'The full name should exist' do
      subject.fullname = ''
      expect(subject).not_to be_valid
    end

    it 'The fullname should not be longer than 30 characters' do
      subject.fullname = 'kwehjkwehfkjewhfewhfkdhfkdhfkdhfkdjfkldjfkljflkwjflwdjflkdjfkldjfklsdf'
      expect(subject).not_to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { is_expected.to have_many(:opinions) }
    it { is_expected.to have_many(:followings) }
    it { is_expected.to have_many(:followers) }
  end
end
