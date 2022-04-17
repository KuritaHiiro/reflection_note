class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notes, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :book_marks, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true 
end
