RSpec.describe Tweet do
  let(:user) { User.create(id: 2, username: 'elisha', fullname: 'user fullname') }

  let(:subject) do
    described_class.new(
      text: 'fksdfj sjdflsd',
      author: user
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:text) }

    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end

    it 'The author of the opinion should exist' do
      subject.author = nil
      expect(subject).not_to be_valid
    end

    it 'The text of the opinion should not be shorter than 1 character' do
      subject.text = ''
      expect(subject).not_to be_valid
    end

    it 'The text of the opinion should not be longer than 1200 characters' do
      subject.text = 'It has roots in a
       piece of classical Latin literature
       from 45 BC, making it over 2000 years
        old. Richard McClintock, a Latin professor at
         Hampden-Sydney College in Virginia, looked
          up one of the more obscure Latin words,
           consectetur, from a Lorem Ipsum passage,
            and going through the cites of the word
             in classical literature, discovered the
              undoubtable source. Lorem Ipsum comes
               from sections 1.10.32 and 1.10.33 of
                "de Finibus Bonorum et Malorum" (The Extremes of
                   Good and Evil) by Cicero, written in 45 BC. This book is a treatise
                    on the theory of ethics, very popular during the Renaissance.
                    The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..",
                    comes from a line in section 1.10.32.'
      expect(subject).not_to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { is_expected.to belong_to(:author) }
  end
end
