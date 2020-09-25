require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全てのデータが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nameが6文字以下で登録できる" do
        @user.name = "aaaaa"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @user.name = ""
        expect(@user.errors.full_messages).to include
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        expect(@user.errors.full_messages).to include
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        expect(@user.errors.full_messages).to include
      end
      it "emailが空では登録できない" do
        @user.email = ""
        expect(@user.errors.full_messages).to include
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(@user.errors.full_messages).to include
      end
      it "profileが空では登録できない" do
        @user.profile = ""
        expect(@user.errors.full_messages).to include
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        expect(@user.errors.full_messages).to include
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaaa"
        @user.password_confirmation = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
