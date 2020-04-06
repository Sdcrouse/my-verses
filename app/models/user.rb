class User < ApplicationRecord
  # --------- Associations and validations ------------------
  has_secure_password
  has_many :my_verses
  has_many :verse_references, through: :my_verses

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # Here's where I got the format validation: https://stackoverflow.com/questions/38611405/email-validation-in-ruby-on-rails#answer-49925333

  #------------ Helper methods -------------------
  def full_name
    if self.first_name.present? && self.last_name.present?
      "#{self.first_name} #{self.last_name}"
    end
  end

  def self.from_fb_omniauth(auth_info)
    # It looks like I have access to the Facebook image; I should use that as a stretch goal.

    where(email: auth_info["email"]).first_or_initialize do |user|
      user.email = auth_info["email"]
      user.password = SecureRandom.hex

      split_name = auth_info["name"].split(" ")

      user.first_name = split_name.first
      user.last_name = split_name.last
      user.username = split_name.join(".").downcase
    end
  end

  def has_verse_reference?(vr)
    self.verse_references.include?(vr)
  end

  def find_myverse_with_reference(ref)
    self.my_verses.find_by(verse_reference: ref)
  end

  def self.with_most_my_verses
    # Find the user with the most my_verses
    
    # self.all, find the user with the maximum value of my_verses.count
    # where method

    # Get the count of each user's my_verses.
    # Get the user whose count of my_verses is the maximum.

    my_verse_totals = []
    
    self.all.each do |user|
      my_verse_totals << user.my_verses.count
    end

    self.all.detect do |user|
      user.my_verses.count == my_verse_totals.max
    end
  end
end
