require 'syntax/convertors/html'

module SyntaxHelpers
  def ruby(&b)
    convertor = Syntax::Convertors::HTML.for_syntax "ruby"
    html = convertor.convert(capture_erb(&b).strip)
    html = "<notextile>#{html}</notextile>"
    concat_erb(html, b.binding)
  end
end

Webby::Helpers.register(SyntaxHelpers)
