require 'rails_helper'

RSpec.describe "Feature Test: Page Links", type: :feature do
  let (:all_page_paths) do
    [root_path, signup_path]
  end

  describe "Each page" do
    it "has a link to the homepage" do
      all_page_paths.each do |pagepath|
        visit pagepath
        expect(page).to have_link("Home", href: pagepath)
      end
    end
  end

  # Add separate tests for when the user is logged out and logged in.
  # The available pages will be different.

end