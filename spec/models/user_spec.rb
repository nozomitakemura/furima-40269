require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
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
        @user.nick_name = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailが存在する場合は登録できない。' do
        FactoryBot.create(:user, email: 'test@example.com')
        @user.email = 'test@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'emailは@を含まないと登録できない。' do
        user = FactoryBot.build(:user, email: 'testexample.com')
        user.valid?
        expect(user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字混合で入力してください'
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '1234'
        @user.password_confirmation = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字混合で入力してください'
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'こんにちは'
        @user.password_confirmation = 'こんにちは'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字混合で入力してください'
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'password1'
        @user.password_confirmation = 'password2'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'お名前(全角)は名字と名前両方が無いと登録できない' do
        @user.first_name = ''
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", "First name は全角（漢字・ひらがな・カタカナ）で入力してください", "Family name can't be blank", "Family name は全角（漢字・ひらがな・カタカナ）で入力してください"
      end

      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.first_name = 'test'
        @user.family_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name は全角（漢字・ひらがな・カタカナ）で入力してください'
      end

      it 'お名前カナ(全角)は、名字と名前がそれぞれないと登録できない' do
        @user.first_name_kana = '' 
        @user.family_name_kana = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana は全角（カタカナ）で入力してください'
      end

      it 'お名前カナ(全角)は、全角（カタカナ）での入力でないと登録できない' do
        @user.first_name_kana = 'てすと'
        @user.family_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana は全角（カタカナ）で入力してください'
      end

      it '生年月日の登録がないと登録できない' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end
