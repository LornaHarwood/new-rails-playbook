class Page < ApplicationRecord
  def to_param
    "#{id}-#{slug}"
  end
end
