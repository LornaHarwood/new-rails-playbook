require "rails_helper"

RSpec.feature "User can navigate to a specific page from the index page" do
  context "When a page exists" do
    scenario "the index page's show link targets the associated page" do
      test_page = Page.create(title: "test title", content: "test content", slug: "test-slug")

      visit pages_path
      click_link "Show"

      expect(page).to have_content(test_page.title)
      expect(page).to have_content(test_page.content)
    end
  end

  context "When multiple pages exist" do
    scenario "the index page's show links target the associated page" do
      Page.create(title: "test title one", content: "test content one", slug: "test-slug-one")
      test_page_two = Page.create(title: "test title two", content: "test content two", slug: "test-slug-two")
      Page.create(title: "test title three", content: "test content three", slug: "test-slug-three")

      visit pages_path

      find('a[data-slug="test-slug-two"]').click
      expect(page).to have_content(test_page_two.title)
      expect(page).to have_content(test_page_two.content)
    end
  end
end
