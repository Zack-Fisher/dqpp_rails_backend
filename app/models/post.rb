class Post < ApplicationRecord
    post = Post.new(title: 'New Post', content: 'This is the content of the new post.')
    post.save
end
