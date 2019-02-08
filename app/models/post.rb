class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  def pretty_message
    message.gsub(/\r/, '<br>')
  end

  def editable?
    if created_at > DateTime.now - 10.minutes
      return true
    else
      return false
    end
  end

end
