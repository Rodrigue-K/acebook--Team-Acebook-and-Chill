class Post < ApplicationRecord
  belongs_to :user

  def pretty_message
    message.gsub(/\r/, '<br>')
  end
 
end
