require "rails_helper"

RSpec.feature "User can navigate straight back to root page from any location via the navbar" do
  context "When user is on any page" do
    scenario "they can navigate directly back to the home page" do
      test_page = Page.create(title: "test title one", content: "test content one", slug: "test-slug-one")

      visit page_path(test_page.id)

      within "nav" do
        click_on "Home"
      end

      expect(page).to have_content("List of all Pages")
    end
  end
end
