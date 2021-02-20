require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  context "コメントがうまく行く時" do
    it "全てが揃っている時コメントできる" do
      expect(@comment).to be_valid
    end
  end

  context "コメントがうまくいかない時" do
    it "タイトルが空だとコメントできない" do
      @comment.title = ""
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Title can't be blank")
    end
    it "評価が0だとコメントできない" do
      @comment.evaluation_id = 0
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Evaluation must be other than 0")
    end
    it "レビューが空だとコメントできない" do
      @comment.review = ""
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Review can't be blank")
    end
  end
end
