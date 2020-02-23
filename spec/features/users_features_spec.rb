require 'rails_helper'

RSpec.describe "Feature Test: User Signup", type: :feature do
  before { visit signup_path }

  describe "Signup Page" do
    it "is successfully rendered at the /signup route" do
      expect(page.status_code).to eq(200)
      expect(current_path).to eq("/signup")
    end

    it "instructs the user to sign up" do
      # This way, I can instruct the user to sign up however I want to.
      expect(page).to have_selector("h1")
    end

    it "has nested inputs for username, email, first name, last name, and password" do
      # This adds more flexibility to the way I name my input fields.
      expect(page).to have_field("user_username")
      expect(page).to have_field("user_email")
      expect(page).to have_field("user_first_name")
      expect(page).to have_field("user_last_name")
      expect(page).to have_field("user_password")
    end
  end
end