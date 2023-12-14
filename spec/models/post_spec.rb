require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new() }

  context 'Is created without variables' do

    it "validates to error the presence of title" do
      subject.save

      expect(subject.errors[:title]).to include("can't be blank")
    end

    it "validates to error the presence of author" do
      subject.save

      expect(subject.errors[:author]).to include("must exist")
    end
  end

  context 'Is created with variables' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    before do
      subject.title = 'Test title'
      subject.author = user
    end

    it 'validates without errors the presence of title' do
      expect(subject.title).to  eql('Test title')
      expect(subject.errors[:title]).to be_empty
    end

    it 'validates without errors the presence of author' do
      expect(subject.author).to_not be_nil
      expect(subject.errors[:author]).to be_empty
    end
  end

end
