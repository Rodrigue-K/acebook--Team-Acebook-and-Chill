require 'spec_helper'

RSpec.feature "edit post", type: :feature  do 
  let(:message){ 'Hello, world!'}
  let(:email){'bea_courage@hotmail.co.uk'}
  let(:username){'Makers'}
  let(:password){'testingisfunlol'}

  before(:each) {
    sign_up(email, username, password)
    post_on_userwall(message) 
  }

  context "user wants to edit a post" do
    it 'has a edit link' do
        expect(page).to have_link("edit")
    end


  end

end 