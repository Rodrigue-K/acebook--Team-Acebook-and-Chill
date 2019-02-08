require 'rails_helper'

RSpec.feature "Writing posts on someone elses wall", type: :feature do


  let(:email){'bea_courage@hotmail.co.uk'}
  let(:username){'Makers'}
  let(:password){'testingisfunlol'}
  let(:message){"What a wonderful post!"}


  scenario "Can submit posts and view them" do
    sign_up(email, username, password)
    post_on_userwall(message)
    expect(page).to have_content("What a wonderful post!")
  end
end
