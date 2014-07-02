class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :message, presence: true
  
  def date_short
    created_at.to_formatted_s(:short)
  end
  
  def date_long
    created_at.to_formatted_s(:long)
  end
  
  def phone_placer
    (phone || '-')
  end
end
