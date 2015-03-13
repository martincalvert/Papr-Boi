module ApplicationHelper
  def visible_group_options
    VisibleGroup.all.flat_map {|group| [[group.name, group.id]]}
  end
end
