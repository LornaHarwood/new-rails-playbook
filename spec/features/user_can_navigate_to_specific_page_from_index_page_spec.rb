require "rails_helper"

RSpec.feature "User can navigate to a specific page from the index page" do
  context "When multiple pages exist" do
    scenario "the page title links to the associated page_path" do
      Page.create(title: "test title one", content: "test content one", slug: "test-slug-one")
      test_page_two = Page.create(title: "test title two", content: "test content two", slug: "test-slug-two")
      Page.create(title: "test title three", content: "test content three", slug: "test-slug-three")

      visit pages_path

      within ".sidebar-nav" do
        find('a[href$="test-slug-two"]').click
      end

      expect(page).to have_content(test_page_two.title)
      expect(page).to have_content(test_page_two.content)
    end
  end
end
