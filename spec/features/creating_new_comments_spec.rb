require 'rails_helper'


RSpec.feature "New comments" do

   let(:email){"bea_courage@hotmail.co.uk"}
   let(:password){"hellothere"}
   let(:message){"Nice message"}

   scenario "User can add comments" do
   sign_up(email, password)
   click_on 'logout'
   sign_in(email, password)
   post_message(message)
   click_link 'Add Comment'
   fill_in 'Name', with: 'Bea'
   fill_in 'Comment', with: 'Great Pic!'
   click_button 'Create Comment'
   expect(page).to have_content('Bea')
   expect(page).to have_content('Great Pic!')


   end






end
