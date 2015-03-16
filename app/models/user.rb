class User < ActiveRecord::Base
  has_secure_password

  def self.visible_groups groups
    self.name.constantize.where("ARRAY#{groups} && visible_group_ids")
  end
end
