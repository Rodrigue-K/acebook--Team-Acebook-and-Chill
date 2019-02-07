
RSpec.feature 'Walls' do
    
    #user 1
    let(:email){'bea_courage@hotmail.co.uk'}
    let(:username){'Makers'}
    let(:password){'testingsucks'}
    let(:message){' hello  world'}
    # user 2
    let(:email2){'hux@hotmail.co.uk'}
    let(:username2){'lizard_one'}
    let(:password2){'queenisalizard'}
    let(:message2){'hissssss'}

    before {
        sign_up(email, username, password)
        visit('/posts')
        post_message(message) 
        visit('/walls')
    }
  
    context 'visit wall' do
      
        it 'should display posts of the user on their wall' do 
            expect(page).to have_content(message)
        end
    end 

    context 'multiple users' do 

        before {
            click_link 'Logout'
            sign_up(email2, username2, password2)
            visit('/posts')
            post_message(message2) 
            visit('/walls')
        }
        it 'should not display posts of other user on there wall' do 
            expect(page).not_to have_content(message)
        end

      
    end

    context 'posting on someone elses wall ' do 
        
        before {
            click_link 'Logout'
            sign_up(email2, username2, password2)
            visit("/walls?name='Makers'")
            post_on_userwall(message2) 
        }
        it 'other users should be able to post on our page' do 
            expect(page).to have_content(message)
        end

    end 


  
  
  end
  