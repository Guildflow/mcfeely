defmodule McFeely.MarkdownTools do
  def rendered_markdown(markdown_text) when markdown_text in [nil, ""] do
    markdown_text
  end

  def rendered_markdown(markdown_text) do
    {:ok, html_doc, _error_messages} = Earmark.as_html(markdown_text)
    HtmlSanitizeEx.markdown_html(html_doc)
  end
end
