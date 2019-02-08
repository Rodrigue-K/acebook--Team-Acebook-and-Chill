require 'rails_helper'

RSpec.feature 'User Authenication' do

  let(:email){'bea_courage@hotmail.co.uk'}
  let(:username){'Makers'}
  let(:password){'testingisfunlol'}

  context 'Log in' do

    scenario 'A user can log in' do
      sign_up(email, username, password)
      click_on 'Logout'
      log_in(email, password)
      expect(page.current_path).to eql('/walls')
    end
  end
end
