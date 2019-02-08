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

  describe 'editable ' do

    it 'should return a true that post is editable if made within last ten minuetes ' do
      cat = Post.create(message: message, created_at: DateTime.now)
      expect(cat.editable?).to be(true)
    end 


    it 'should return a false that post is editable if not made within last ten minuetes ' do
      cat = Post.create(message: message, created_at: (DateTime.now - 20.minutes))
      expect(cat.editable?).to be(false)
    end
  end


end
