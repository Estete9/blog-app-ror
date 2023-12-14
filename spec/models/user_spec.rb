require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  it 'validates presence of name' do
    subject.save

    expect(subject.errors[:name]).to include("can't be blank")
  end

  context 'when using positive numbers' do
    let(:posts_counter) { 5 }

    before do
      subject.posts_counter = posts_counter
    end

    it 'validates true if posts counter is greater or equal to 0' do
      subject.save

      expect(subject.errors[:posts_counter]).to be_empty
    end
  end

  context 'when using negative numbers' do
    let(:posts_counter) { -50 }

    before do
      subject.posts_counter = posts_counter
    end

    it 'validates false if posts counter is negative' do
      subject.save

      expect(subject.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end
  end

  context 'when using zero' do
    let(:posts_counter) { 0 }

    before do
      subject.posts_counter = posts_counter
    end

    it 'validates true if posts counter is zero' do
      subject.save

      expect(subject.errors[:posts_counter]).to be_empty
    end
  end
end
