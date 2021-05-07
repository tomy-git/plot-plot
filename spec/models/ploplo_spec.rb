# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    user = FactoryBot.create(:user)
    expect(FactoryBot.build(:plot)).to be_valid
  end
end
