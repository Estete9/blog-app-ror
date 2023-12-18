require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new }
  let(:positive_counter) { 5 }
  let(:negative_counter) { -5 }
  let(:zero_counter) { 0 }

  context 'Is created without variables' do
    it 'validates to error the presence of title' do
      subject.save

      expect(subject.errors[:title]).to include("can't be blank")
    end

    it 'validates to error the presence of author' do
      subject.save

      expect(subject.errors[:author]).to include('must exist')
    end
  end

  context 'Is created with variables' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    before do
      subject.title = 'Test title'
      subject.author = user
    end

    it 'validates without errors the presence of title' do
      subject.save

      expect(subject.title).to eql('Test title')
      expect(subject.errors[:title]).to be_empty
    end

    it 'validates without errors the presence of author' do
      subject.save

      expect(subject.author).to_not be_nil
      expect(subject.errors[:author]).to be_empty
    end
  end

  context '#comments_counter' do
    it 'uses postive numbers' do
      subject.comments_counter = positive_counter

      subject.save

      expect(subject.errors[:comments_counter]).to be_empty
    end

    it 'uses zero' do
      subject.comments_counter = zero_counter

      subject.save

      expect(subject.errors[:comments_counter]).to be_empty
    end

    it 'uses negative numbers' do
      subject.comments_counter = negative_counter

      subject.save

      expect(subject.errors[:comments_counter]).to include('must be greater than or equal to 0')
    end
  end

  context '#likes_counter' do
    it 'uses postive numbers' do
      subject.likes_counter = positive_counter

      subject.save

      expect(subject.errors[:likes_counter]).to be_empty
    end

    it 'uses zero' do
      subject.likes_counter = zero_counter

      subject.save

      expect(subject.errors[:likes_counter]).to be_empty
    end

    it 'uses negative numbers' do
      subject.likes_counter = negative_counter

      subject.save

      expect(subject.errors[:likes_counter]).to include('must be greater than or equal to 0')
    end
  end

  context '#update_posts_counter' do
    let(:user) do
      User.create(
        id: 1,
        name: 'Tom',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: zero_counter
      )
    end

    it 'updates the posts counter when post is created' do
      expect(user.posts_counter).to eq(0)

      post = Post.new(id: 1, author: user, title: 'post title', comments_counter: 0, likes_counter: 0)

      post.save

      expect(post.comments_counter).to eq(0)
      expect(post.likes_counter).to eq(0)

      user.reload

      expect(user.posts_counter).to eq(1)
    end
  end
end
