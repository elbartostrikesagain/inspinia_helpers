module InspiniaHelpers::Modals
  include ActionView::Helpers::TagHelper

  def modal_dialog(size='md', id='modal', klass=nil, &block)
    size = ['sm', 'md', 'lg'].include?(size) ? size : 'md'
    content = capture(&block) if block
    content = content_tag(:div, content, :class => "modal-dialog modal-#{size}")
    content_tag(:div, content, :id => id, :class => "modal inmodal #{klass}")
  end

  def modal_content(klass=nil, &block)
    header = Proc.new {|&block| modal_header(&block) }
    body = Proc.new {|&block| modal_body(&block) }
    footer = Proc.new {|&block| modal_footer(&block) }
    content = capture(header, body, footer, &block)
    content_tag(:div, content, :class => "modal-content #{klass}")
  end

  def modal_header(&block)
    content = capture(&block) if block
    content_tag(:div, content, :class => "modal-header")
  end

  def modal_body(&block)
    content = capture(&block) if block
    content_tag(:div, content, :class => "modal-body")
  end

  def modal_footer(&block)
    content = capture(&block) if block
    content_tag(:div, content, :class => "modal-footer")
  end

  def modal_close
    close_button nil, "data-dismiss" => "modal"
  end

  def modal_loading
    content = modal_content do |header, body, footer|
      header.call do
        content_tag(:h4, 'Loading', :class => "modal-title")
      end +
      body.call do
        content_tag(:div, spinner, :class => "text-center")
      end +
      footer.call
    end
    content_tag(:div, content, :id => 'modal-loading')
  end
end