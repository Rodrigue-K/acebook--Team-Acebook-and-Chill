require 'rails_helper'

RSpec.feature "Writing posts on someone elses wall", type: :feature do


  let(:email){'bea_courage@hotmail.co.uk'}
  let(:username){'Makers'}
  let(:password){'testingisfunlol'}


  scenario "Can submit posts and view them" do
    sign_up(email, username, password)
    click_link "post on wall"
    fill_in "Message", with: "What a wonderful post!"
    click_button "Submit"
    expect(page).to have_content("What a wonderful post!")
  end
end
