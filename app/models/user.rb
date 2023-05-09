class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def stock_already_tracked?(stock)
    stocks = current_user_stocks
    return false unless stocks
    stocks.where(stock: stock).exists?
  end

  def under_stock_limit?
    stocks.count < 10
  end 

  def can_track_stock?(stock)
    under_stock_limit? && !stock_already_tracked?(stock)
  end

  def current_user_stocks
    Stock.where(id: UserStock.where(user_id: id).pluck(:stock_id))
  end
end
