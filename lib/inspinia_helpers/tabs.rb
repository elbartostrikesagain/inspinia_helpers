module InspiniaHelpers::Tabs
  def tab_buttons(num_tabs, id=nil, &block)
    id = '-' + id if id.present?
    tabs = num_tabs.times.map.with_index {|idx| Proc.new {|klass, &block| tab_button("#{idx+1}#{id}", klass, &block) } }
    content = capture(*tabs, &block)
    content_tag(:ul, content, :class => "nav nav-tabs")
  end

  def tab_content(num_tabs, id=nil, &block)
    id = '-' + id if id.present?
    tabs = num_tabs.times.map.with_index {|idx| Proc.new {|klass, &block| tab_pane("#{idx+1}#{id}", klass, &block) } }
    content = capture(*tabs, &block)
    content_tag(:div, content, :class => "tab-content")
  end

private

  def tab_button(tab_number, klass=nil, &block)
    content = capture(&block)
    content = content_tag(:a, content, 'data-toggle' => 'tab', :href => "#tab-#{tab_number}")
    content_tag(:li, content, :class => "#{klass}")
  end

  def tab_pane(tab_number, klass=nil, &block)
    content = capture(&block)
    content_tag(:div, content, :id => "tab-#{tab_number}", :class => "tab-pane #{klass}")
  end
end
