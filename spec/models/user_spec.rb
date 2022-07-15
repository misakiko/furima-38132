require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
   context '新規登録できる場合' do
      it 'すべての項目を入力していれば登録できる'do
        expect(@user).to be_valid
      end
   end
   context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it 'passwordが6文字以下では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'passwordは半角英数字を含まないと登録できない' do
      end
      it 'last_nameは漢字、ひらがな、カタカナ以外は登録できない' do
      end
      it 'first_nameは漢字、ひらがな、カタカナ以外は登録できない' do
      end
      it 'last_name_kanaはカタカナ以外は登録できない' do
      end
      it 'first_name_kanaはカタカナ以外は登録できない' do
      end
    end
  end 
end
