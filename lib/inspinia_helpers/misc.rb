module InspiniaHelpers::Misc
  def spinner(klass=nil, size='2x', &block)
    content = icon('spinner', size, 'fa-spin', &block)
    content_tag(:div, content, :class => "loading-spinner #{klass}")
  end

  def icon(icon, size='1x', klass=nil, &block)
    size = ['1x', '2x', '3x', '4x', '5x'].include?(size) ? size : '1x'
    content = capture(&block) if block
    content_tag(:i, content, :class => "fa fa-#{icon} fa-#{size} #{klass}")
  end

  def category_list(klass=nil, &block)
    content = capture(&block) if block
    content_tag(:ul, content, :style => "padding: 0", :class => "category-list color #{klass}")
  end

  def icon_li(href, icon_name, &block)
    content = capture(&block) if block
    content = icon(icon_name) +
      content_tag(:span, content, :class => "text-primary")
    content = content_tag(:a, content, :href => href)
    content_tag(:li, content)
  end

  def close_button(klass=nil, options={})
    content = content_tag(:span, '&times;'.html_safe, "aria-hidden" => "true")
    content += content_tag(:span, 'Close', :class => "sr-only")
    content_tag(:button, content, options.merge(:type => "button", :class => "close #{klass}"))
  end

  def horizontal_form_element(form, field, method, label_column_size='2', field_column_size='10', options={})
    errors = form.object.errors.messages[field]
    klass = (errors.present? ? 'form-control error' : 'form-control')
    content = form.send(method, field, options.merge(:class => klass))
    if errors.present?
      content += content_tag(:label, errors.join('. '), :class => "error")
    end
    final_content = form.label(field, :class => "col-sm-#{label_column_size} control-label")
    final_content += content_tag(:div, content, :class => "col-sm-#{field_column_size}")
    content_tag(:div, final_content, :class => "form-group")
  end
end
