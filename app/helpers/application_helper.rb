module ApplicationHelper

  def yes_no(value)
    title = value ? 'Ja' : 'Nein'
    icon = value ? 'icon-ok' : 'icon-remove'
    content_tag(:i, '', class: icon, title: title)
  end
end
