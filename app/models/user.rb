class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  def full_name
    if self.first_name.present? && self.last_name.present?
      "#{self.first_name} #{self.last_name}"
    end
  end
end
