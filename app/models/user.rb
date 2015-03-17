class User < ActiveRecord::Base
  has_secure_password

  def self.visible_groups groups
    users = User.where(visible_group_ids: nil)
    if groups
      users += User.where("ARRAY#{groups} && visible_group_ids")
    end
    users.uniq
  end
end
