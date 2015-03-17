class Section < ActiveRecord::Base
  validates :name, uniqueness: true

  def self.visible_groups groups
    sections = Section.where(visible_group_ids: nil)
    if groups
      sections += Section.where("ARRAY#{groups} && visible_group_ids")
    end
    sections.uniq
  end
end
