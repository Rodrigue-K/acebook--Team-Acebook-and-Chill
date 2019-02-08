require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:message){'hi /r its barry'}

  it "post belongs to a user" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  it 'returns a message with line breaks' do 
    cat = Post.new
    cat.message = message
    expect(cat.pretty_message).to eql(message)
  end

 
end
