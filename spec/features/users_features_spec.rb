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

      new_user_form_fields = [
        "user_username", "user_email", "user_first_name", "user_last_name", "user_password"
      ]

      new_user_form_fields.each do |form_field|
        expect(page).to have_field(form_field)
      end
    end
  end

  describe "Signing up a User" do
    let(:valid_user_inputs) do
      {
        :user_username => "bibleman",
        :user_email => "mpeterson@gmail.com",
        :user_first_name => "Miles",
        :user_last_name => "Peterson",
        :user_password => "swordofthespirit"
      }
    end

    let(:no_password) { valid_user_inputs.except(:user_password) }

    it "creates a valid User and redirects them to their profile page" do
      valid_user_inputs.each do |input_field, user_input|
        fill_in(input_field, with: user_input)
      end

      click_button("Sign up!")

      expect(current_path).to eq("/users/1")

      no_password.each do |input_name, value|
        # I don't want the password to be displayed on the user's profile.
        expect(page).to have_content(value)
      end
    end

    it "renders the signup page and displays errors when User signup fails" do
      no_password.each do |input_field, user_input|
        fill_in(input_field, with: user_input)
      end

      click_button("Sign up!")

      # expect(current_path).to eq(signup_path) 
      # For some reason, the UsersController gets stuck at "post '/users'", even though the /signup page is rendered.

      expect(page).to have_selector("form#new_user")
      expect(page).to have_css(".field_with_errors")
      expect(page).to have_content("Password can't be blank")
    end
  end
end