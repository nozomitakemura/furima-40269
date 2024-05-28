require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.nick_name = ''  # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Nick name can't be blank"
    end
    
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

  
=begin 
    it '重複したemailが存在する場合は登録できない。' do
      FactoryBot.create(:user, email: 'test@example.com')
      user = FactoryBot.build(:user, email: 'test@example.com')
      user.valid?
      expect(user.errors.full_messages).to include "Email has already been taken"
    end
    it 'emailは@を含まないと登録できない。' do
      user = FactoryBot.build(:user, email: 'testexample.com')
      user.valid?
      expect(user.errors.full_messages).to include "Email is invalid"
    end
 
=end 

    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが5文字以下では登録できない' do
      user = FactoryBot.build(:user)
      user.password = 'abc12'
      user.password_confirmation = 'abc12'
      user.valid?
      expect(user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordが半角英数字混合での入力でない場合は登録できない' do
      user = FactoryBot.build(:user)
      user.password = 'password'
      user.password_confirmation = 'password'
      user.valid?
      expect(user.errors.full_messages).to include "Password は半角英数字混合で入力してください"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      user = FactoryBot.build(:user)
      user.password = 'password1'
      user.password_confirmation = 'password2'
      user.valid?
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
end
end