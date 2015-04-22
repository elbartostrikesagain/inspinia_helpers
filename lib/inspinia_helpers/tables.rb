module InspiniaHelpers::Tables
  def table(id=nil, options={}, &block)
    content = capture(&block) if block
    content_tag(:table, content, options.merge(:id => id, :class => "table table-striped table-bordered table-hover display"))
  end
end