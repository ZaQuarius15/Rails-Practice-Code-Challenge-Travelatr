class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 30 }

  def total_likes
    total = 0
    self.posts.each do |post|
      total += post.likes
    end
    total
  end

  def featured_post
    p_likes = 0
    top_post = nil
    self.posts.each do |post|
      if post.likes > p_likes
        p_likes = post.likes
        top_post = post
      end
    end
    top_post
  end

end
