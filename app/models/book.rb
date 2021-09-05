class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :book_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # def self.looks(searches, word)
  #   if searches == "forward_match"
  #     @books = Book.where(["title LIKE? OR body LIKE?", "#{word}%", "#{word}%"])
  #   elsif searches == "backward_match"
  #     @books = Book.where(["title LIKE? OR body LIKE?", "#{word}%", "#{word}%"])
  #   elsif searches == "perfect_match"
  #     @books = Book.where(["title LIKE? OR body LIKE?", "#{word}%", "#{word}%"])
  #   elsif searches == "partical_match"
  #     @books = Book.where(["title LIKE? OR body LIKE?", "#{word}%", "#{word}%"])
  #   end
  # end

end
