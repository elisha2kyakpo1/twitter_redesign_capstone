require './rails_helper'

RSpec.describe Following do
  let(:user1) { User.create(id: 1, username: 'elisha', full_name: 'elisha full_name') }
  let(:user2) { User.create(id: 2, username: 'henok', full_name: 'henok full_name') }

  let(:subject) do
    described_class.new(
      follower: user1,
      followed: user2
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:follower_id) }
    it { is_expected.to validate_presence_of(:followed_id) }
    it { is_expected.to validate_uniqueness_of(:followed).scoped_to(:follower_id) }

    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end

    it 'The follower of the following is user1' do
      expect(subject.follower = user1).to be_valid
    end

    it 'The follower of the following should exist' do
      subject.follower = nil
      expect(subject).not_to be_valid
    end

    it 'The followed of the following is user2' do
      expect(subject.followed = user2).to be_valid
    end

    it 'The followed of the following should exist' do
      subject.followed = nil
      expect(subject).not_to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { is_expected.to belong_to(:follower) }
    it { is_expected.to belong_to(:followed) }

    context '' do
      u1 = User.new(id: 2, username: 'user1', full_name: 'user1 full_name')
      u2 = User.new(id: 1, username: 'user2', full_name: 'user2 full_name')
      f1 = u1.active_followings.build(followed: u2)

      it '' do
        expect(f1).to be_valid
      end
      it '' do
        expect(f1.follower = u1).to be_valid
      end
      it '' do
        expect(f1.followed = u2).to be_valid
      end
    end
  end
end
