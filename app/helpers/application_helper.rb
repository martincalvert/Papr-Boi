module ApplicationHelper
  def visible_group_options
    VisibleGroup.all.flat_map {|group| [[group.name, group.id]]}
  end

  def roles_options
    {'Module Editing' => 1, 'CSS Pack Editing' => 2, 'Email Creation' => 3}
  end
end
