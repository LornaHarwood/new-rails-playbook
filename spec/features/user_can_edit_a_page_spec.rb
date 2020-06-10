require "rails_helper"

RSpec.feature "User can edit a page" do
  context "When a page exists" do
    scenario "The page's title can be changed" do
      test_page = Page.create(title: "test_title", content: "test_content", slug: "test_slug")

      visit page_path(test_page.id)
      expect(page).to have_content(test_page.title)

      click_link "Edit"
      fill_in "Title", with: "Edited Page Title"
      click_button "Update Page"

      expect(page).to have_content("Edited Page Title")
    end

    scenario "The page's content can be changed" do
      test_page = Page.create(title: "test_title", content: "test_content", slug: "test_slug")

      visit page_path(test_page.id)
      expect(page).to have_content(test_page.content)

      click_link "Edit"
      fill_in "Content", with: "Edited Page Content"
      click_button "Update Page"

      expect(page).to have_content("Edited Page Content")
    end
  end
end
