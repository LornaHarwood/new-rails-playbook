class Page < ApplicationRecord
  validates_presence_of :content, :slug
  validates :slug, format: {without: /[^\w-]/,
                            message: "only supports alphanumeric and - characters"}

  def to_param
    "#{id}-#{slug}"
  end
end
