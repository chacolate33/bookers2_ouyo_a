class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy 
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.looks(searches, word)
    if searches == "forward_match"
      @books = Book.where("text LIKE?", "#{word}%")
    elsif searches == "backward_match"
      @books = Book.where("text LIKE?", "#{word}%")
    elsif searches == "perfect_match"
      @books = Book.where("#{word}")
    else searches == "partical_match"
      @books = Book.where("text LIKE?", "%#{word}%")
    end
  end
  
  validates :title, presence: true
  validates :body, presence: true
  validates :body, {length: {maximum: 200}}
end
