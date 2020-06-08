require 'rails_helper'

RSpec.feature "User can view a page" do
  context "Given the page exists" do
    scenario "show action renders the page's content" do
      test_page = Page.create(title: "test_title", content: "test_content", slug: "test_slug")

      visit page_path(test_page.id)

      expect(page).to have_content(test_page.content)
    end

    scenario "show action renders the page's title" do
      test_page = Page.create(title: "test_title", content: "test_content", slug: "test_slug")

      visit page_path(test_page.id)

      expect(page).to have_content(test_page.title)
    end
  end
end
