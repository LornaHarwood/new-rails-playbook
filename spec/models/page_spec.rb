require "rails_helper"

RSpec.describe Page, type: :model do
  subject { Page.create(title: "test title", content: "test content", slug: "test-slug") }

  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:slug) }
  end
end
