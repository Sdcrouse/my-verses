require 'rails_helper'

RSpec.describe "Feature Test: Static Pages", type: :feature do
  describe "Homepage" do
    before { visit root_path }

    it "is successfully rendered at the root route" do
      expect(page.status_code).to eq(200)
      expect(current_path).to eq("/")
    end

    it "displays the name of the app" do
      within "h1" do
        expect(page).to have_content("MyVerses")
      end
    end
  end
end