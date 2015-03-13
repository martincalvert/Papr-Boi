class Style < ActiveRecord::Base
  validates :name, uniqueness: true
end
