require "rails_helper"

RSpec.describe Page, type: :model do
  subject { Page.create(title: "test title", content: "test content", slug: "test-slug") }

  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:slug) }

    context "When a slug contains a space" do
      it "is not valid" do
        expect(Page.new).not_to allow_value("the is a bad slug").for(:slug)
      end
    end

    context "When a slug contains a question mark" do
      it "is not valid" do
        expect(Page.new).not_to allow_value("slug??").for(:slug)
      end
    end

    context "When a slug only contains word characters" do
      it "is valid" do
        expect(Page.new).to allow_value("thisisaslug").for(:slug)
      end
    end

    context "When a slug contains dashes" do
      it "is valid" do
        expect(Page.new).to allow_value("this-is-a-slug").for(:slug)
      end
    end
  end
end
