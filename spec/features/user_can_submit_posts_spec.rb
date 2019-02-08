require 'rails_helper'

RSpec.feature "Writing posts", type: :feature do


  let(:email){'bea_courage@hotmail.co.uk'}
  let(:username){'Makers'}
  let(:password){'testingisfunlol'}
  let(:message){"What a wonderful post!"}


  scenario "Can submit posts and view them" do
    sign_up(email, username, password)
    click_on 'Logout'
    log_in(email, password)
    expect(page.current_path).to eql('/walls')
    post_on_userwall(message)
    expect(page).to have_content("What a wonderful post!")
  end
end
