module ApplicationHelper
  def markdown(text, additional_options = {})
    if text.nil?
      text = ""
    end

    extensions = {
      tables:                       true,
      autolink:                     true,
      disable_indented_code_blocks: true,
      strikethrough:                true,
      superscript:                  true
    }

    options = {
      filter_html:     true,
      hard_wrap:       true,
      space_after_headers: true,
      fenced_code_blocks: true,
      link_attributes: { rel: 'nofollow', target: "_blank" }
    }.merge(
      additional_options
    )

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
