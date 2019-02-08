require 'rails_helper'

RSpec.feature "User walls", type: :feature do

  let(:email){'bea_courage@hotmail.co.uk'}
  let(:username){'Makers'}
  let(:password){'testingisfunlol'}


  context "user is signed up" do
    it 'after signing up is redirected to their wall' do
        sign_up(email, username, password)
        expect(page.current_path).to eql("/walls")
    end
  end
end