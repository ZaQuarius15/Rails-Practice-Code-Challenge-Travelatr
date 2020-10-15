class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers , through: :posts


  def top_five
    self.posts.last(5)
  end

  def featured_post
    p_likes = 0
    top_post = 0
    self.posts.each do |post|
      if post.likes > p_likes
        p_likes = post.likes
        top_post = post
      end
    end
    posts.last
  end

  def average_age
    total = 0
    u_bloggers = self.posts.map { |post| post.blogger }.uniq
    u_bloggers.each do |blogger|
      total += blogger.age 
    end
    total / u_bloggers.count
  end

end


