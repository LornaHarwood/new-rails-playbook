require "rails_helper"

RSpec.feature "User can create a page" do
  context "When a new page form is submitted" do
    scenario "new action displays the page's title and content" do
      title = "New Page"
      content = "New Page Content"

      visit new_page_path

      fill_in "Title", with: title
      fill_in "Content", with: content

      click_button "Create Page"

      expect(page).to have_content(title)
      expect(page).to have_content(content)
    end
  end
end
