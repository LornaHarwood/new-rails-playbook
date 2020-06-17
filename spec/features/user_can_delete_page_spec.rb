require "rails_helper"

RSpec.feature "User can delete a page" do
  context "When a page exists" do
    scenario "the destroy action removes it from the database" do
      test_page_one = Page.create(title: "test title one", content: "test content one", slug: "test-slug-one")
      test_page_two = Page.create(title: "test title two", content: "test content two", slug: "test-slug-two")

      visit pages_path

      expect(page).to have_content(test_page_one.title)
      expect(page).to have_content(test_page_two.title)

      find('input[type="submit"][data-slug="test-slug-two"][data-action="delete"]').click

      expect(page).to have_content(test_page_one.title)
      expect(page).not_to have_content(test_page_two.title)
    end
  end
end
