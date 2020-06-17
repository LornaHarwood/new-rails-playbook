class Page < ApplicationRecord
  validates_presence_of :content, :slug

  def to_param
    "#{id}-#{slug}"
  end
end
