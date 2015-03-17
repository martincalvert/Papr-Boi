class Style < ActiveRecord::Base
  validates :name, uniqueness: true

  def self.visible_groups groups
    styles = Style.where(visible_group_ids: nil)
    if groups
      styles += Style.where("ARRAY#{groups} && visible_group_ids")
    end
    styles.uniq
  end
end
