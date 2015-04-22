module InspiniaHelpers::Panel
  def standard_box(&block)
    title = Proc.new {|&block| box_title_bar(&block) }
    content = Proc.new {|&block| box_content(&block) }
    content = capture(title, content, &block)
    content_tag(:div, content, :class => "ibox float-e-margins")
  end

  def panel(klass=nil, &block)
    heading = Proc.new {|&block| panel_heading(&block) }
    content = Proc.new {|&block| panel_body(&block) }
    content = capture(heading, content, &block)
    content_tag(:div, content, :class => "panel #{klass}")
  end

private

  def box_title_bar(&block)
    tools = Proc.new {|&block| box_title_tools(&block) }
    content = capture(tools, &block)
    content_tag(:div, content, :class => "ibox-title")
  end

  def box_title_tools(&block)
    content = capture(&block)
    content_tag(:div, content, :class => "ibox-tools")
  end

  def box_content(&block)
    content = capture(&block)
    content_tag(:div, content, :class => "ibox-content")
  end

  def panel_heading(&block)
    options = Proc.new {|&block| panel_options(&block) }
    content = capture(options, &block)
    content_tag(:div, content, :class => "panel-heading")
  end

  def panel_options(&block)
    content = capture(&block)
    content_tag(:div, content, :class => "panel-options")
  end

  def panel_body(&block)
    content = capture(&block)
    content_tag(:div, content, :class => "panel-body")
  end
end
