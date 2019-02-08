class Post < ApplicationRecord
  belongs_to :user

  def pretty_message
    message.gsub(/\r/, "\r")
  end

  def editable?
    if created_at > DateTime.now - 10.minutes
      return true
    else
      return false
    end
  end
 
end
