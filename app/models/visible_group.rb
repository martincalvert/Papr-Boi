class VisibleGroup < ActiveRecord::Base
  validates :name, uniqueness: true
end
