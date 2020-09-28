require 'rails_helper'

RSpec.describe Dance, type: :model do
  describe 'エントリー機能の登録' do
    before do
      @dance = FactoryBot.build(:dance)
      @dance.image = fixture_file_upload('dancer.jpeg')
    end
    context 'エントリーがうまくいくとき' do
      it 'すべての値が正しく入力されていれば登録できること' do
        expect(@dance).to be_valid
      end
    end
    context 'エントリーがうまくいかないとき' do
      it 'titleが空だと登録できないこと' do
        @dance.title = ''
        @dance.valid?
        expect(@dance.errors.full_messages).to include
      end
      it 'imageが空だと登録できないこと' do
        @dance.image = nil
        @dance.valid?
        expect(@dance.errors.full_messages).to include
      end
      it 'introduceが空だと登録できないこと' do
        @dance.introduce = ''
        @dance.valid?
        expect(@dance.errors.full_messages).to include
      end
      it 'genreを選択していないと登録できないこと' do
        @dance.genre_id = 0
        @dance.valid?
        expect(@dance.errors.full_messages).to include("Genre can't be blank")
      end
      it 'reservation_timeを選択していないと登録できないこと' do
        @dance.reservation_time = ''
        @dance.valid?
        expect(@dance.errors.full_messages).to include("Reservation time can't be blank")
      end
      it 'priceが空だと登録できないこと' do
        @dance.price = nil
        @dance.valid?
        expect(@dance.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end
      it 'priceが300円未満では登録できないこと' do
        @dance.price = 0
        @dance.valid?
        expect(@dance.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが9,999,999円を超過すると登録できないこと' do
        @dance.price = 10_000_000
        @dance.valid?
        expect(@dance.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが全角数字だと登録できないこと' do
        @dance.price = '２０００'
        @dance.valid?
        expect(@dance.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
