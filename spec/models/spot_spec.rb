require 'rails_helper'

RSpec.describe Spot, type: :model do
  before do
    @spot = FactoryBot.build(:spot)
  end

  describe 'スポット投稿' do
    context 'スポット投稿がうまくいく時' do
      it '全てが揃っていれば登録できること' do
        expect(@spot).to be_valid
      end
    end

    context 'スポット投稿がうまくいかない時' do
      it 'スポット画像が添付されていないと投稿できない' do
        @spot.image = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Image can't be blank")
      end
      it 'ジャンルが0だと投稿できない' do
        @spot.genre_id = 0
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Genre must be other than 0")
      end
      it "場所が0だと投稿できない" do
        @spot.place_id = 0
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Place must be other than 0")
      end
      it "説明が空だと投稿できない" do
        @spot.explanation = ""
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Explanation can't be blank")
      end
      it "通信環境が0だと投稿できない" do
        @spot.wifi_id = 0
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Wifi must be other than 0")
      end
    end
  end
end
