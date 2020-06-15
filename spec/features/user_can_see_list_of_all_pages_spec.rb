require "rails_helper"

RSpec.feature "User can see list of all pages" do
  context "When a page exists" do
    scenario "the index page shows the page's title" do
      test_page = Page.create(title: "test title", content: "test content", slug: "test-slug")

      visit pages_path

      expect(page).to have_content("List of all Pages")
      expect(page).to have_content(test_page.title)
      expect(page).to have_content("Show")
    end
  end

  context "When multiple pages exist" do
    scenario "the index page shows all the page titles" do
      test_page_one = Page.create(title: "test title one", content: "test content one", slug: "test-slug-one")
      test_page_two = Page.create(title: "test title two", content: "test content two", slug: "test-slug-two")
      test_page_three = Page.create(title: "test title three", content: "test content three", slug: "test-slug-three")

      visit pages_path

      expect(page).to have_content("List of all Pages")
      expect(page).to have_content(test_page_one.title)
      expect(page).to have_content(test_page_two.title)
      expect(page).to have_content(test_page_three.title)
      expect(page).to have_content("Show")
    end
  end
end
