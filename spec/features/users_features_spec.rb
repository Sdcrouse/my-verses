require 'rails_helper'

RSpec.describe "Feature Test: User Signup", type: :feature do
  before { visit signup_path }

  describe "Signup Page" do
    it "is successfully rendered at the /signup route" do
      expect(page.status_code).to eq(200)
      expect(current_path).to eq("/signup")
    end

    it "instructs the user to sign up" do
      within "h1" do
        expect(page).to have_content("Sign up")
      end
    end

    it "has fields for username, email, first name, last name, and password" do
      expect(page).to have_content("Username")
      expect(page).to have_content("Email")
      expect(page).to have_content("First Name")
      expect(page).to have_content("Last Name")
      expect(page).to have_content("Password")
    end
  end
end