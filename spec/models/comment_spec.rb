require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(user_id: 1, post_id: 1, text: 'test comment') }

  let(:user) do
    User.create(
      id: 1,
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )
  end

  let(:post) do
    Post.create(
      id: 1,
      author: user,
      title: 'post title',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  context '#update_comments_counter' do
    it 'updates the comments counter when a comment is created' do
      expect(post.comments_counter).to eq(0)

      subject.save
      post.reload

      expect(post.comments_counter).to eq(1)
    end
  end
end
