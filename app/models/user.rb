class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  validates :nick_name, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は半角英数字混合で入力してください' }
  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :family_name, presence: true
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :family_name_kana, presence: true
  validates :family_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :birth_day, presence: true
end
