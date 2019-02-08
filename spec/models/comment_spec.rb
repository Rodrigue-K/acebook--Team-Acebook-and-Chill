require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "comments belong to posts" do
    assc = described_class.reflect_on_association(:post)
    expect(assc.macro).to eq :belongs_to
  end

  it "comments belong to user" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end




end
