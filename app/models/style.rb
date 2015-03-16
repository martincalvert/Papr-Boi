class Style < ActiveRecord::Base
  validates :name, uniqueness: true

  def self.visible_groups groups
    self.name.constantize.where("ARRAY#{groups} && visible_group_ids")
  end
end
