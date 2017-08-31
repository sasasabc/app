class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #ポストモデルとの1:多連携
  has_many :posts

  #ポストモデルとの多:多連携
  has_many :favorites, dependent: :destroy
  
  #userモデル(自分自身)との多:多連携
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :followed_id

  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :following

  #デバイス設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #キャリアウェーブ設定
  mount_uploader :user_image, ImageUploader

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end


end
